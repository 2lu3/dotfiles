#!/bin/bash
set -xe

# ========== neovim ==========
# https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package

if [[ "$is_init" = true ]]; then
    rm ~/.local/bin/nvim
fi

if ! type nvim > /dev/null 2>&1; then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    sudo chmod u+x nvim.appimage
    mv nvim.appimage ~/.local/bin/nvim
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
sudo npm install -g neovim

# python
if [[ "$is_init" = true ]]; then
    rm ~/.pynvim -rf
fi

if [[ ! -e "$HOME/.pynvim" ]]; then
    python3 -m venv ~/.pynvim
    ~/.pynvim/bin/pip3 install -U pip
    ~/.pynvim/bin/pip3 install pynvim
fi
