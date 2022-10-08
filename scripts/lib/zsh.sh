#!/bin/bash
set -xe

# sudo apt-get install -y zsh

# zgen
if [[ "$is_init" = true ]]; then
    rm ~/.zgen -rf
fi
if [[ ! -e "$HOME/.zgen" ]]; then
    git clone https://github.com/tarjoilija/zgen.git ~/.zgen
fi
