#!/bin/bash
set -xe

if [[ "$is_init" = true ]]; then
    if [[ -e "$HOME/.linuxbrew" ]]; then
        rm -rf "${HOME}/.linuxbrew"
    fi

    if [[ -e "/home/linuxbrew" ]]; then
        sudo rm -rf "/home/linuxbrew"
    fi
fi

if [[ ! -e "$HOME/.linuxbrew" ]]; then
    if [[ ! -e "/home/linuxbrew" ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
fi

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
