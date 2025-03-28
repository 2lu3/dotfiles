#!/bin/bash
set -e

source script/lib/utils.sh

apt_install zsh zsh
if [[ "$SHELL" != "$(which zsh)" ]]; then
    chsh -s $(which zsh)
fi


if [[ ! -e "$HOME/.zgen" ]]; then
    git clone https://github.com/tarjoilija/zgen.git ~/.zgen
fi
