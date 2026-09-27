"""Run with: python3 tests/check_tool_setup.py [path/to/chezmoi]."""

import itertools
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile


root = Path(__file__).resolve().parents[1]
chezmoi = sys.argv[1] if len(sys.argv) > 1 else "chezmoi"
prompt = (root / "dot_config/zsh/rc/prompt.zsh").read_text()
zshrc = (root / "dot_global.zshrc").read_text()

assert 'starship init zsh' in prompt
assert zshrc.index('source "$Z_RC_DIR/plugin.zsh"') < zshrc.index('source "$Z_RC_DIR/prompt.zsh"')


def render(name, platform, features):
    return subprocess.check_output(
        [chezmoi, "--source", str(root), "--config", "/dev/null",
         "--config-format", "toml", "--override-data",
         json.dumps({"chezmoi": {"os": platform}, "features": features}),
         "execute-template", "--file", str(root / name)], text=True,
    )


with tempfile.TemporaryDirectory() as directory:
    temp = Path(directory)
    log = temp / "calls"
    env = dict(os.environ, PATH=f"{temp}:/usr/bin:/bin", CALL_LOG=str(log), ZDOTDIR=str(temp))
    stubs = {
        "brew": '''case "$1" in
    shellenv) printf 'export PATH="%s:$PATH"\n' "$(dirname "$0")" ;;
    list) test "${BREW_INSTALLED:-0}" = 1 ;;
    *) echo "brew $*" >> "$CALL_LOG" ;;
esac''',
        "dpkg-query": "printf 'install ok installed'",
        "mkdir": ":",  # The package script must not write to the real home.
        "sudo": "exit 99",  # All apt packages are already present.
        "uv": 'echo "uv $*" >> "$CALL_LOG"',
        "mise": 'echo "mise $*" >> "$CALL_LOG"',
    }
    for name, body in stubs.items():
        executable = temp / name
        executable.write_text("#!/bin/bash\nset -eu\n" + body + "\n")
        executable.chmod(0o755)

    for platform in ("linux", "darwin"):
        for flags in itertools.product((False, True), repeat=4):
            features = dict(zip(("shell", "dev", "ai", "gui"), flags))
            setup = render("run_onchange_after_setup-tools.sh.tmpl", platform, features)
            shell = render("dot_global.zshenv.tmpl", platform, features)
            plugins = render("dot_config/zsh/rc/plugin.zsh.tmpl", platform, features)
            for executable, script in (("bash", setup), ("zsh", shell), ("zsh", plugins)):
                subprocess.run([executable, "-n"], input=script, text=True, check=True)
            assert "zgen load romkatv/powerlevel10k" not in plugins
            assert "zgen reset" in plugins
            for plugin in ("zdharma-continuum/fast-syntax-highlighting",
                           "zsh-users/zsh-autosuggestions", "zsh-users/zsh-completions"):
                assert plugin in plugins
            managed_shell = shell.split('if [ -f "$Z_DOT_DIR/.zshenv.local"')[0]
            resolved_uv = subprocess.check_output(
                ["zsh", "-f"], input=managed_shell + "\ncommand -v uv\n", text=True, env=env,
            ).strip()
            assert resolved_uv == str(temp / "uv"), resolved_uv
            # Exercise feature gates while skipping unrelated zsh-file edits.
            definitions, actions = setup.split('\nif [ "$SHELL_FEATURE_ENABLED"', 1)
            script = definitions + '''
install_zgen() { :; }
ensure_global_source() { :; }
remove_global_source() { :; }
if [ "$SHELL_FEATURE_ENABLED"''' + actions
            for installed in ("0", "1"):
                log.write_text("")
                result = subprocess.run(
                    ["bash"], input=script, text=True, capture_output=True,
                    env=dict(env, BREW_INSTALLED=installed),
                )
                if platform == "linux" and features["gui"]:
                    assert result.returncode != 0 and "only supported on macOS" in result.stderr
                    assert not log.read_text()
                    continue
                assert result.returncode == 0, result.stderr
                calls = log.read_text().splitlines()
                action = "upgrade" if installed == "1" else "install"
                assert (f"brew {action} neovim" in calls) == features["dev"], calls
                if installed == "0":
                    assert ("brew install lsd" in calls) == features["shell"], calls
                    assert ("brew install starship" in calls) == features["shell"], calls
                    assert ("brew install tmux" in calls) == features["shell"], calls
                    assert ("brew install uv" in calls) == features["dev"], calls
                    assert ("brew install mise" in calls) == (features["dev"] or features["ai"]), calls

            if platform == "linux" and features["gui"]:
                continue
            calls = log.read_text().splitlines()
            assert ("mise install node@24" in calls) == (features["dev"] or features["ai"]), calls
            assert ("mise exec node@24 -- mise install npm:neovim@latest npm:@fsouza/prettierd@latest" in calls) == features["dev"], calls
            assert ("mise exec node@24 npm:opencommit[trust_policy_excludes=@octokit/plugin-paginate-rest@9.2.2]@latest -- oco config set OCO_LANGUAGE=ja" in calls) == features["ai"], calls
            for tool in ("pynvim", "doq", "ruff"):
                assert (f"uv tool install --upgrade --managed-python {tool}" in calls) == features["dev"], calls
            assert "npm install" not in log.read_text()

            for cli, package in {"oco": "opencommit[trust_policy_excludes=@octokit/plugin-paginate-rest@9.2.2]", "codex": "@openai/codex",
                                 "claude": "@anthropic-ai/claude-code[allow_builds=@anthropic-ai/claude-code]", "paseo": "@getpaseo/cli"}.items():
                wrapper = render(f"dot_local/bin/executable_{cli}.tmpl", platform, features)
                log.write_text("")
                result = subprocess.run(["sh", "-c", wrapper, cli, "--version"], env=env,
                                        text=True, capture_output=True)
                if features["ai"]:
                    assert result.returncode == 0, result.stderr
                    assert log.read_text().strip() == f"mise exec node@24 npm:{package}@latest -- {cli} --version"
                else:
                    assert result.returncode == 1 and not log.read_text()

    zgen = temp / ".zgen"
    zgen.mkdir()
    (zgen / "init.zsh").write_text("romkatv/powerlevel10k\n")
    (zgen / "zgen.zsh").write_text('''ZGEN_INIT="$HOME/.zgen/init.zsh"
zgen() {
    printf '%s\\n' "$*" >> "$CALL_LOG"
    case "$1" in
        reset) rm -f "$ZGEN_INIT" ;;
        saved) test -f "$ZGEN_INIT" ;;
        save) : > "$ZGEN_INIT" ;;
    esac
}
''')
    log.write_text("")
    result = subprocess.run(["zsh", "-f"], input=plugins, text=True, capture_output=True,
                            env=dict(env, HOME=str(temp)))
    assert result.returncode == 0, result.stderr
    assert log.read_text().splitlines() == ["reset", "saved",
                                             "load zdharma-continuum/fast-syntax-highlighting",
                                             "load zsh-users/zsh-autosuggestions",
                                             "load zsh-users/zsh-completions", "save"]

print("OK: Linux/macOS feature combinations, Homebrew installs, mise CLI wrappers, and uv tools")
