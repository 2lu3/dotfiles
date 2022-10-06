#!/bin/bash
set -xe

if [[ "$is_init" = true ]]; then
    rm -rf "${HOME}/.linuxbrew"
fi

if [[ ! -e "$HOME/.linuxbrew" ]]; then
    git clone https://github.com/Homebrew/brew ${HOME}/.linuxbrew
    eval "$(${HOME}/.linuxbrew/bin/brew shellenv)"
    brew update --force --quiet
    chmod -R go-w "$(brew --prefix)/share/zsh"
fi

eval "$(${HOME}/.linuxbrew/bin/brew shellenv)"
