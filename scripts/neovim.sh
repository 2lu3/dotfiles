#!/bin/bash
set -xe

# ========== neovim ==========
# https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package

if [[ "$is_init" = true ]]; then
    rm ~/.local/bin/nvim -f
fi

if ! type nvim > /dev/null 2>&1; then
    wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb -O /tmp/neovim.deb
    sudo dpkg -i /tmp/neovim.deb
fi


# ========== dependencies ==========

if [[ "$is_init" = true ]]; then
    rm ~/.cache/dein -rf
fi

# dein
if [[ ! -e "$HOME/.cache/dein" ]]; then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
    sh /tmp/installer.sh ~/.cache/dein
fi

# nodejs
if ! npm ls --location=global | grep neovim >/dev/null; then
    sudo npm install --location=global neovim
fi

# python
if [[ "$is_init" = true ]]; then
    rm ~/.pynvim -rf
fi

if [[ ! -e "$HOME/.pynvim" ]]; then
    python3 -m venv ~/.pynvim
    ~/.pynvim/bin/pip3 install -U pip
    ~/.pynvim/bin/pip3 install pynvim
fi
