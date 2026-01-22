#!/bin/bash
set -e

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

    brew install peco ghq neovim direnv deno mise lsd
    brew install --cask alt-tab

    mise install node@24
    mise use -g node@24

    npm install -g opencommit
    oco config set OCO_LANGUAGE=japanese
    oco config set OCO_LANGUAGE=ja
    oco config set OCO_EMOJI=true
    
    # ここに他のインストール処理を追加
}

main