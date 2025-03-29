#!/bin/bash

source scripts/lib/utils.sh

install neovim nvim
install fd fdfind
install trach-cli trash
install deno deno
install fzf fzf

sudo npm install --location=global neovim

if [[ ! -e "$HOME/.pynvim" ]]; then
python3 -m venv $HOME/.pynvim
~/.pynvim/bin/pip install -u pip
~/.pynvim/bin/pip install pynvim doq
fi



