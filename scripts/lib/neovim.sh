#!/bin/bash
set -xe

# ========== neovim ==========
# https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim

# ========== dependencies ==========

# required for telescope
sudo apt-get install -y fd-find

# nodejs
if [[ "$is_init" = true ]]; then
    sudo npm uninstall --location=global neovim
fi
if ! npm ls --location=global | grep neovim >/dev/null; then
    sudo npm install --location=global neovim
fi

# python
if [[ "$is_init" = true ]]; then
    rm ~/.pynvim/ -rf
fi
if [[ ! -e "$HOME/.pynvim" ]]; then
    python3 -m venv ~/.pynvim
    ~/.pynvim/bin/pip install -U pip
    ~/.pynvim/bin/pip install pynvim doq
fi

# trach-cli
sudo apt-get install -y trash-cli

