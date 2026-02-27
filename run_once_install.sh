#!/bin/bash
set -xe

# ~/.${name} に .${name}.global を読み込む行を追加（既にあればスキップ）
# 用法: ensure_sources_global zshenv または ensure_sources_global zshrc
ensure_sources_global() {
    local name="$1"
    local file="${HOME}/.${name}"
    local marker="# load global ${name} (managed by chezmoi run_once_install)"
    local source_line="[ -f \"\${HOME}/.${name}.global\" ] && source \"\${HOME}/.${name}.global\""

    if [ -f "$file" ] && grep -q "$marker" "$file" 2>/dev/null; then
        echo "~/.${name} already sources .${name}.global, skipping..."
        return 0
    fi

    echo "Adding .${name}.global source to ~/.${name}..."
    {
        echo ""
        echo "$marker"
        echo "$source_line"
    } >> "$file"
}

# zgenのインストール
install_zgen() {
    if [ -d "${HOME}/.zgen" ]; then
        echo ".zgen is already installed, skipping..."
        return 0
    fi

    echo "Installing zgen..."
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
}

main() {
    ensure_sources_global zshenv
    ensure_sources_global zshrc
    install_zgen

    if ! type brew > /dev/null 2>&1; then
        eval "$(/opt/homebrew/bin/brew shellenv)"

        if ! type brew > /dev/null 2>&1; then
            echo "brew is not installed"
            return 1
        fi
    fi

    brew install peco ghq neovim direnv deno mise lsd gh
    brew install --cask alt-tab wezterm

    if ! type npm > /dev/null 2>&1; then
    	eval "$(mise activate zsh)"
    	mise install node@24
    	mise use -g node@24
    fi


    npm install -g opencommit
    oco config set OCO_LANGUAGE=ja
    oco config set OCO_EMOJI=true
    
}

main
