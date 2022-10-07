#!/bin/bash
set -xe

# ========== neovim ==========
# https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package


brew install neovim


# ========== dependencies ==========

# dein
if [[ "$is_init" = true ]]; then
    rm ~/.cache/dein -rf
fi
if [[ ! -e "$HOME/.cache/dein" ]]; then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
    sh /tmp/installer.sh ~/.cache/dein
fi

# nodejs
if [[ "$is_init" = true ]]; then
    npm uninstall --location=global neovim
fi
if ! npm ls --location=global | grep neovim >/dev/null; then
    npm install --location=global neovim
fi

# python
if [[ "$is_init" = true ]]; then
    rm ~/.pynvim -rf
fi
if [[ ! -e "$HOME/.pynvim" ]]; then
    python3 -m venv ~/.pynvim
    ~/.pynvim/bin/pip3 install -U pip
    ~/.pynvim/bin/pip3 install pynvim doq
fi

brew install trash-cli
