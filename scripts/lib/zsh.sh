#!/bin/bash
set -xe

pushd $(dirname $0)
source ./utils.sh

apt_install zsh zsh
chsh -s $(which zsh)

# zgen
if [[ "$is_init" = true ]]; then
    rm ~/.zgen -rf
fi

if [[ ! -e "$HOME/.zgen" ]]; then
    git clone https://github.com/tarjoilija/zgen.git ~/.zgen
fi

popd
