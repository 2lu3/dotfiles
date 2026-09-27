# dotfiles

task_tracker: linear

## Requirements

* chezmoi
* macOS: Homebrew is installed before applying this repository
* Ubuntu: Homebrew is installed before enabling shell, dev, or ai
* Ubuntu: `sudo` is only needed when selected apt packages are missing

## Installation

### Linux

shell・dev・ai のいずれかを使う場合は、先に [Homebrew](https://brew.sh/) を導入します。

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
```

```bash
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply 2lu3
```

### macOS

```bash
brew install chezmoi
chezmoi init --apply 2lu3
```

### Ubuntuの事前インストール

`chezmoi init --apply` の途中で `sudo` を使わない場合は、baseを実行し、選択する機能のブロックも実行します。baseは常に有効です。`lsd` と `tmux` は Homebrew で導入します。

#### base

```bash
sudo apt-get update
sudo apt-get install -y ca-certificates curl git unzip
```

#### shell

```bash
sudo apt-get install -y zsh
```

#### dev / ai

Homebrew 導入後は、開発ツールを `chezmoi apply` が brew でインストールします。追加の apt パッケージはありません。Homebrew 自体に必要なビルドツールは [Linux版の公式手順](https://docs.brew.sh/Homebrew-on-Linux) を参照してください。

初回の `chezmoi init` で、shell・dev・ai・gui の機能を個別に選択します。base は常に有効です。選択内容はユーザーごとの `~/.config/chezmoi/chezmoi.toml` に保存されます。

## Features

| 機能 | 内容 |
| -- | -- |
| base | Git、ダウンロード・展開に必要な基本ツールと Git 設定。常に有効 |
| shell | zsh、zgen、tmux、lsd と関連設定 |
| dev | Neovim、gh、ghq、peco、direnv、uv、mise と関連設定 |
| ai | OpenCommit、Codex CLI、Claude Code CLI、Paseo CLI。dev も有効な場合は Neovim の Copilot 設定 |
| gui | WezTerm、AltTab と関連設定。macOS のみ |

機能の選択は独立しています。ai を選択しても dev 全体は有効にならず、OpenCommit に必要な Node.js 24 と mise だけを用意します。

## エージェント設定

共通の agent ルールは `~/.agents/rules/`、共通スキルは `~/.agents/skills/` を正本として管理します。`chezmoi apply` の同期スクリプトが、`rules/` と `skills/` を Codex の `~/.codex/` と Claude Code の `~/.claude/` へコピーします。ルート設定は各ツール用に分け、それぞれ自身のディレクトリを参照します。

既存の Codex の `.system` や Paseo 管理スキル、`config.toml`、認証情報、履歴、キャッシュは管理対象にせず保持します。用途別ルールや `flow` などプロジェクト固有の設定は、rules リポジトリから対象プロジェクトへ導入します。

## OS とパッケージ

* macOS は Homebrew の formula と cask を使用します。Homebrew は事前にインストールしてください。
* Ubuntu の開発ツールと mise は Homebrew を使用します。lsd と tmux も Homebrew、base とログインシェル用の zsh は apt で導入します。選択したaptパッケージがすべて導入済みなら、`sudo` と apt の処理をスキップします。不足分がある場合だけ、不足パッケージを `sudo` で導入します。
* Ubuntu で `gui = true` を指定すると、ツールのセットアップ時に未対応エラーになります（設定ファイルの配置後）。
* 機能やパッケージの一覧は `.chezmoidata/features.yaml` で、`feature -> OS -> 導入方法` の順に管理しています。パッケージを追加するときは、対象機能の OS 別リストを更新してください。

### インストールされるものと sudo 権限

以下は `chezmoi apply` で導入されるものの一覧です。macOS、および Ubuntu の shell / dev / ai は Homebrew が事前に導入済みであることを前提にしています。`sudo` 欄は、導入処理の実行時に必要な権限を示します。Ubuntu は `dpkg-query` で導入状態を確認し、必要な場合だけ `sudo` を実行します。

| feature | ソフトウェア | macOS | Ubuntu | sudo |
| -- | -- | -- | -- | -- |
| base | `ca-certificates` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 不足時のみ |
| base | `curl` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 不足時のみ |
| base | `git` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 不足時のみ |
| base | `unzip` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 不足時のみ |
| shell | `lsd` | Homebrew formula | Homebrew formula | 不要 |
| shell | `tmux` | Homebrew formula | Homebrew formula | 不要 |
| shell | `zsh` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 不足時のみ |
| shell | `zgen` | `~/.zgen` に git clone | `~/.zgen` に git clone | 不要 |
| dev | `direnv` | Homebrew formula | Homebrew formula | 不要 |
| dev | `fzf` | Homebrew formula | Homebrew formula | 不要 |
| dev | `gh` | Homebrew formula | Homebrew formula | 不要 |
| dev | `ghq` | Homebrew formula | Homebrew formula | 不要 |
| dev / ai | `mise` | Homebrew formula | Homebrew formula | 不要 |
| dev | `neovim` | Homebrew formula | Homebrew formula | 不要 |
| dev | `peco` | Homebrew formula | Homebrew formula | 不要 |
| dev | `ripgrep` | Homebrew formula | Homebrew formula | 不要 |
| dev | `uv` | Homebrew formula | Homebrew formula | 不要 |
| dev / ai | Node.js 24 | mise | mise | 不要 |
| dev | `neovim`（npm パッケージ） | mise npm backend | mise npm backend | 不要 |
| dev | `pynvim` | uv tool | uv tool | 不要 |
| dev | `doq` | uv tool | uv tool | 不要 |
| dev | `ruff` | uv tool | uv tool | 不要 |
| dev | `@fsouza/prettierd` | mise npm backend | mise npm backend | 不要 |
| ai | `opencommit` | mise npm backend | mise npm backend | 不要 |
| ai | `@openai/codex` | mise npm backend | mise npm backend | 不要 |
| ai | `@anthropic-ai/claude-code` | mise npm backend | mise npm backend | 不要 |
| ai | `@getpaseo/cli` | mise npm backend | mise npm backend | 不要 |
| gui | `alt-tab` | Homebrew cask | 対応なし | 不要 |
| gui | `wezterm` | Homebrew cask | 対応なし | 不要 |

## ランタイム

* Python 本体、仮想環境、依存関係は uv で管理します。Node.js と Go は mise で管理し、開発用の言語バージョンは各プロジェクトの `.python-version`、`pyproject.toml`、`mise.toml` に任せます。
* `dev` を選択しただけでは Python、Node.js、Go のグローバルバージョンを設定しません。Go 本体も自動導入しません。
* Neovim、OpenCommit、Codex CLI、Claude Code CLI、Paseo CLI が必要とする Node.js 24 は mise でインストールします。Node.js 24 は各 CLI の wrapper 経由でだけ有効になり、開発用のグローバルバージョンにはしません。
* Node と npm 製 CLI のバージョン指定は `.chezmoidata/features.yaml` の `mise_tools` にまとめています。npm 製 CLI は mise の `npm:` backend でツールごとに導入し、wrapper と Neovim が必要なツールを `mise exec` で選びます。
* OpenCommit の依存 `@octokit/plugin-paginate-rest@9.2.2` は、[公式の9系向けセキュリティ修正](https://github.com/octokit/plugin-paginate-rest.js/releases/tag/v9.2.2)・npm の公開者・配布物の SHA-512 を確認したうえで、provenance 判定の例外をそのバージョンだけに限定しています。mise の検証全体は無効化しません。上流の依存更新後にこの例外を削除できます。
* Claude Code は配布されたネイティブ実行ファイルを配置するため、自身の postinstall だけを mise の `allow_builds` で許可しています。
* `ai` を有効にすると `oco`、`codex`、`claude`、`paseo` が `~/.local/bin` に配置されます。
* Neovim の Python provider は `uv tool install --upgrade --managed-python pynvim` で用意します。Python 本体も uv 管理とし、プロジェクトの仮想環境とは分離します。`doq` と `ruff` も別々の uv tool 環境に導入します。
* uv tool のコマンドは `~/.local/bin` に配置します。Neovim 0.12 以降が `pynvim-python` を自動検出するため、`python3_host_prog` の固定指定は不要です。以前の `~/.local/share/dotfiles/nvim-venv` は自動削除しません。
* Neovim のフォーマッターはプロジェクトの `.venv/bin/ruff` と `node_modules/.bin/prettierd` を優先し、見つからない場合は共通のツールを使用します。LSP は引き続き Mason で管理します。
* fzf のバイナリは Homebrew で導入し、Neovim の build hook ではダウンロードしません。zsh 連携は `fzf --zsh` を使います。
* zsh は Homebrew の PATH を初期化してから mise を有効化します。
* Neovim は起動後に lazy.nvim がプラグインを自動更新します。指定のないプラグインは既定ブランチの最新コミットを使い、`fzf-preview.vim` はリモートプラグイン用の `release/remote` ブランチを維持します。
* `blink.cmp` の最新メインブランチを使うため、Neovim 0.12 以上が必要です。
* `pycreate` は `uv venv` を使って `.venv` を作成します。Poetry と pyenv は新しい導入経路では使用しません。

## 設定の変更

```bash
chezmoi edit-config
chezmoi diff
chezmoi apply --dry-run --verbose
chezmoi apply
```

設定ファイルは選択した機能に応じて配置します。dev=false では mise・direnv のシェル初期化、Neovim の `EDITOR`、開発用 alias、ghq/peco の関数とキーバインドを有効にしません。shell=false では chezmoi が追加した zsh の読み込み行だけを解除し、ユーザー自身の設定は残します。

`run_onchange_after_setup-tools.sh.tmpl` は、設定ファイルの配置後にパッケージの導入とツールの設定を順番に実行します。初回と、テンプレート展開後のスクリプト内容が変わったときに動きます。エージェント設定のコピーは別の `run_after_copy-agent-settings.sh` で毎回実行します。

同じ構成を再適用しても zsh の読み込み行や導入済みパッケージは重複しません。機能を無効にしても、導入済みパッケージや既存のユーザー設定を自動削除しません。新しい機能やパッケージの選択は、次回の `chezmoi apply` で必要な導入処理を再実行します。

## タスク管理

タスク管理には Linear を使用します。

## mac 手動セットアップ

### app store

* magnet
* trello
* slack
* runcat
* scrool reverser

### homebrew

* alttab

### その他

* Finderを右クリック→オプション→全てのデスクトップに割り当て

## アップデート方法

```bash
chezmoi update
```

Homebrew と uv の共通ツールの更新は次のコマンドで行います（`chezmoi update` だけでは、変更のない導入スクリプトは再実行されません）。

```bash
brew update
brew upgrade
uv tool upgrade --all
```

mise のツールは対象を指定して更新します。例えば開発ツールは次のとおりです。

```bash
mise install node@24
mise exec node@24 -- mise install npm:neovim@latest npm:@fsouza/prettierd@latest
```

AI CLI も `mise_tools.ai` にある `npm:...@latest` を同様に指定します。以前の npm グローバルパッケージや手動配置のバイナリは自動削除しません。

Neovim 内の `:checkhealth vim.provider` で Python provider を確認できます。

## 検証

```bash
python3 tests/check_tool_setup.py
# dotfiles 適用後の Neovim で provider とフォーマッターを確認
nvim --headless -u ~/.config/nvim/init.lua -l tests/check_nvim_tools.lua
```
