#!/bin/bash
set -xe

# https://github.com/junegunn/fzf#using-git

if [[ ! -e "$HOME/.fzf" ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
else
    pushd ~/.fzf
    git pull
    popd
fi
~/.fzf/install --no-completion --key-bindings --no-update-rc
