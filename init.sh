#!/bin/bash
set -xe

# sh -c "$(curl -fsLS https://raw.githubusercontent.com/2lu3/dotfiles/main/init.sh)"

sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply 2lu3
