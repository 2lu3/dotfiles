#!/bin/bash
set -xe

brew install zsh

# zgen
if [[ "$is_init" = true ]]; then
    rm ~/.zgen -rf
fi
if [[ ! -e "$HOME/.zgen" ]]; then
    git clone https://github.com/tarjoilija/zgen.git ~/.zgen
fi
