#!/bin/bash
set -xe

# ========== neovim ==========
# https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim

# ========== dependencies ==========

# nodejs
if [[ "$is_init" = true ]]; then
    npm uninstall --location=global neovim
fi
if ! npm ls --location=global | grep neovim >/dev/null; then
    npm install --location=global neovim
fi

# python
if [[ "$is_init" = true ]]; then
    rm ~/.pynvim/.devbox -rf
fi
if [[ ! -e "$HOME/.pynvim" ]]; then
    pushd ~/.pynvim
    devbox init
    devbox run install
    exit
    popd
fi

# trach-cli
sudo apt-get install -y trash-cli

