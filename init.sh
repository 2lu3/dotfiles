#!/bin/bash
set -xe

# bash -c "$(curl -fsLS https://raw.githubusercontent.com/2lu3/dotfiles/main/init.sh)"

rm ~/.local/share/chezmoi -rf

pushd ~/.local/
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply 2lu3
popd
