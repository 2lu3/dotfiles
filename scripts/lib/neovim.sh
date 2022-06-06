#!/bin/bash
set -xe

# ========== neovim ==========
# https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod u+x nvim.appimage
mv nvim.appimage ~/.local/bin/nvim


# ========== dependencies ==========

# dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
sh /tmp/installer.sh ~/.cache/dein

# nodejs
npm install -g neovim

# python
python3 -m venv ~/.pynvim
~/.pynvim/bin/pip3 install -U pip
~/.pynvim/bin/pip3 install pynvim
