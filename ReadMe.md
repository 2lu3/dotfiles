# dotfiles

task_tracker: linear

## Installation

### macOS / Linux

```bash
sh -c "$(curl -fsLS https://get.chezmoi.io/lb)" -- init --apply 2lu3
```

### Sudo権限がない場合の事前Install

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

なし


## Configuration


```toml
[data.features]
shell = false
dev = false
ai = false
gui = false
```

## テスト

このリポジトリではテストは不要であり、テストを維持・実行しません。

## Features

| 機能 | 内容 |
| -- | -- |
| base | Git、ダウンロード・展開に必要な基本ツールと Git 設定。常に有効 |
| shell | zsh、zgen、Starship、lsd と関連設定 |
| dev | Neovim、gh、ghq、peco、direnv、uv、mise と関連設定 |
| ai | OpenCommit、Codex CLI、Claude Code CLI、Paseo CLI、Cage。dev も有効な場合は Neovim の Copilot 設定 |
| gui | WezTerm、AltTab と関連設定。macOS のみ |

機能の選択は独立しています。ai を選択しても dev 全体は有効にならず、OpenCommit に必要な Node.js 24 と mise だけを用意します。

### インストールされるものと sudo 権限

`sudo` 欄は、導入処理の実行時に必要な権限を示します。Ubuntu は `dpkg-query` で導入状態を確認し、必要な場合だけ `sudo` を実行します。

| feature | ソフトウェア | macOS | Ubuntu | sudo |
| -- | -- | -- | -- | -- |
| base | `ca-certificates` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 不足時のみ |
| base | `curl` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 不足時のみ |
| base | `git` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 不足時のみ |
| base | `unzip` | Homebrew formula | apt | macOS: 不要 / Ubuntu: 不足時のみ |
| shell | `lsd` | Homebrew formula | Homebrew formula | 不要 |
| shell | `starship` | Homebrew formula | Homebrew formula | 不要 |
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
| dev / ai | Go 1.25 | mise | mise | 不要 |
| dev | `neovim`（npm パッケージ） | mise npm backend | mise npm backend | 不要 |
| dev | `pynvim` | uv tool | uv tool | 不要 |
| dev | `doq` | uv tool | uv tool | 不要 |
| dev | `ruff` | uv tool | uv tool | 不要 |
| dev | `@fsouza/prettierd` | mise npm backend | mise npm backend | 不要 |
| ai | `opencommit` | mise npm backend | mise npm backend | 不要 |
| ai | `@openai/codex` | mise npm backend | mise npm backend | 不要 |
| ai | `@anthropic-ai/claude-code` | mise npm backend | mise npm backend | 不要 |
| ai | `@getpaseo/cli` | mise npm backend | mise npm backend | 不要 |
| ai | `cage` | mise 管理の Go で `go install` | mise 管理の Go で `go install` | 不要 |
| gui | `alt-tab` | Homebrew cask | 対応なし | 不要 |
| gui | `wezterm` | Homebrew cask | 対応なし | 不要 |

## 設定の変更

```bash
chezmoi edit-config
chezmoi diff
chezmoi apply --dry-run --verbose
chezmoi apply
```

Neovim は絶対行番号を常時表示します。相対行番号を使いたい場合は、`~/.config/nvim/lua/config/options.lua` の `vim.opt.number` に加えて `vim.opt.relativenumber = true` を設定してください。

インストール後は、`.zshenv` に `.zshenv.local` を読み込む行を一度だけ追加します。shell 機能を有効にした場合は、`.zshenv.global` と `.zshrc.global` も同様に読み込みます。この処理は macOS と Linux の両方で動作します。

## アップデート方法

```bash
chezmoi update
```

```bash
brew update
brew upgrade
```

```bash
uv tool upgrade --all
```

mise のツールは対象を指定して更新します。例えば開発ツールは次のとおりです。

```bash
mise upgrade go
mise install node@24
mise exec node@24 -- mise install npm:neovim@latest npm:@fsouza/prettierd@latest
```

AI CLI も `mise_tools.ai` にある `npm:...@latest` を同様に指定します。Cage は mise 管理の Go を使って更新します。

```bash
GOBIN="$HOME/.local/bin" mise exec go@1.25 -- go install github.com/Warashi/cage@latest
```

以前の npm グローバルパッケージや手動配置のバイナリは自動削除しません。

Linux で Cage の書き込み制限を有効にするには、Landlock ABI 2 以降が必要です。Ubuntu 22.04 の標準カーネル（5.15）は対象外で、Ubuntu 24.04 の標準カーネル（6.8）以降を使用してください。
