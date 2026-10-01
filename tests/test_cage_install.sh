#!/usr/bin/env bash
set -euo pipefail

repository_root="$(git rev-parse --show-toplevel)"

assert_contains() {
    local file="$1"
    local expected="$2"

    if ! grep -Fqx "$expected" "$file"; then
        echo "Expected line not found in $file: $expected" >&2
        exit 1
    fi
}

assert_not_contains() {
    local file="$1"
    local unexpected="$2"

    if grep -Fqx "$unexpected" "$file"; then
        echo "Unexpected line found in $file: $unexpected" >&2
        exit 1
    fi
}

assert_contains "$repository_root/run_after_install.sh.tmpl" '        GOBIN="$HOME/.local/bin" mise exec {{ .mise_tools.go | quote }} -- go install github.com/Warashi/cage@latest'
assert_contains "$repository_root/dot_local/bin/executable_codex.tmpl" 'exec "$mise_command" exec {{ .mise_tools.node | quote }} {{ .mise_tools.ai.codex | quote }} -- cage codex "$@"'
assert_not_contains "$repository_root/.chezmoidata/features.yaml" '    cage: go:github.com/Warashi/cage@latest'
assert_not_contains "$repository_root/dot_config/mise/config.toml.tmpl" '"go:github.com/Warashi/cage" = "latest"'
