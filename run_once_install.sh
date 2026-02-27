#!/bin/bash
set -xe

# zgenのインストール
install_zgen() {
    if [ -d "${HOME}/.zgen" ]; then
        echo ".zgen is already installed, skipping..."
        return 0
    fi
    
    echo "Installing zgen..."
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
}

# メイン処理
main() {
    install_zgen

    if ! type brew > /dev/null 2>&1; then
        eval "$(/opt/homebrew/bin/brew shellenv)"

        if ! type brew > /dev/null 2>&1; then
            echo "brew is not installed"
            return 1
        fi
    fi

    brew install peco ghq neovim direnv deno mise lsd
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
