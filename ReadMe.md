# dotfiles

task_tracker: linear

## Requirements

* chezmoi
* macOS: Homebrew is installed before applying this repository
* Ubuntu: `sudo` can install system packages with `apt`

## Installation

```bash
brew install chezmoi
chezmoi init --apply 2lu3
```

初回の `chezmoi init` で、shell・dev・ai・gui の機能を個別に選択します。base は常に有効です。選択内容はユーザーごとの `~/.config/chezmoi/chezmoi.toml` に保存されます。

## Features

| 機能 | 内容 |
| -- | -- |
| base | Git、ダウンロード・展開に必要な基本ツールと Git 設定。常に有効 |
| shell | zsh、zgen、tmux、lsd と関連設定 |
| dev | Neovim、gh、ghq、peco、direnv、uv、mise と関連設定 |
| ai | OpenCommit、Codex CLI、Claude Code CLI、Paseo CLI。dev も有効な場合は Neovim の Copilot 設定 |
| gui | WezTerm、AltTab、Finicky と関連設定。macOS のみ |

機能の選択は独立しています。ai を選択しても dev 全体は有効にならず、OpenCommit に必要な Node.js 24 と mise だけを用意します。

## OS とパッケージ

* macOS は Homebrew の formula と cask を使用します。Homebrew は事前にインストールしてください。
* Ubuntu は apt を基本に使用します。apt で提供されない uv、mise、ghq、peco は公式配布物からユーザー領域へ導入します。
* Ubuntu で `gui = true` を指定すると、設定の適用前に未対応エラーになります。
* 機能やパッケージの一覧は `.chezmoidata/features.yaml` で、`feature -> OS -> 導入方法` の順に管理しています。パッケージを追加するときは、対象機能の OS 別リストを更新してください。

### インストールされるものと sudo 権限

以下は `chezmoi apply` で導入されるものの一覧です。macOS は Homebrew が事前に導入済みであることを前提にしています。`sudo` 欄は、導入処理の実行時に必要な権限を示します。

| feature | ソフトウェア | macOS | Ubuntu | sudo |
| -- | -- | -- | -- | -- |
| base | `ca-certificates` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 必要 |
| base | `curl` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 必要 |
| base | `git` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 必要 |
| base | `unzip` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 必要 |
| shell | `lsd` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 必要 |
| shell | `tmux` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 必要 |
| shell | `zsh` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 必要 |
| shell | `zgen` | `~/.zgen` に git clone | `~/.zgen` に git clone | 不要 |
| dev | `direnv` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 必要 |
| dev | `fzf` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 必要 |
| dev | `gh` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 必要 |
| dev | `ghq` | Homebrew formula | 公式配布（ユーザー領域） | 不要 |
| dev / ai | `mise` | Homebrew formula | 公式配布（ユーザー領域） | 不要 |
| dev | `neovim` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 必要 |
| dev | `peco` | Homebrew formula | 公式配布（ユーザー領域） | 不要 |
| dev | `ripgrep` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 必要 |
| dev | `uv` | Homebrew formula | 公式配布（ユーザー領域） | 不要 |
| dev / ai | Node.js 24 | mise | mise | 不要 |
| dev | `neovim`（npm パッケージ） | mise / npm | mise / npm | 不要 |
| dev | `pynvim` | uv の仮想環境 | uv の仮想環境 | 不要 |
| dev | `doq` | uv の仮想環境 | uv の仮想環境 | 不要 |
| ai | `opencommit` | mise / npm | mise / npm | 不要 |
| ai | `@openai/codex` | mise / npm | mise / npm | 不要 |
| ai | `@anthropic-ai/claude-code` | mise / npm | mise / npm | 不要 |
| ai | `@getpaseo/cli` | mise / npm | mise / npm | 不要 |
| gui | `alt-tab` | Homebrew cask | 対応なし | 不要 |
| gui | `finicky` | Homebrew cask | 対応なし | 不要 |
| gui | `wezterm` | Homebrew cask | 対応なし | 不要 |

## ランタイム

* Python 本体、仮想環境、依存関係は uv で管理します。Node.js と Go は mise で管理し、開発用の言語バージョンは各プロジェクトの `.python-version`、`pyproject.toml`、`mise.toml` に任せます。
* `dev` を選択しただけでは Python、Node.js、Go のグローバルバージョンを設定しません。Go 本体も自動導入しません。
* Neovim、OpenCommit、Codex CLI、Claude Code CLI、Paseo CLI が必要とする Node.js 24 は mise でインストールします。Node.js 24 は各 CLI の wrapper 経由でだけ有効になり、開発用のグローバルバージョンにはしません。
* `ai` を有効にすると `oco`、`codex`、`claude`、`paseo` が `~/.local/bin` に配置されます。
* Neovim の Python provider は `~/.local/share/dotfiles/nvim-venv` に uv で用意します。
* `pycreate` は `uv venv` を使って `.venv` を作成します。Poetry と pyenv は新しい導入経路では使用しません。

## 設定の変更

```bash
chezmoi edit-config
chezmoi diff
chezmoi apply --dry-run --verbose
chezmoi apply
```

設定ファイルは選択した機能に応じて配置します。dev=false では mise・direnv のシェル初期化、Neovim の `EDITOR`、開発用 alias、ghq/peco の関数とキーバインドを有効にしません。shell=false では chezmoi が追加した zsh の読み込み行だけを解除し、ユーザー自身の設定は残します。

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
* Finickyを一度起動し、既定のWebブラウザに設定する（設定は `~/.finicky.js`。通常クリックはComet、option+クリックはGoogle Chromeの `genda.jp` プロファイルで開く）

## アップデート方法

```bash
chezmoi update
```
