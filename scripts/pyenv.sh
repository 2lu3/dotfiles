#!/bin/bash
set -xe

# https://github.com/pyenv/pyenv#basic-github-checkout

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

rm ~/.pyenv -rf
if [[ ! -e "$HOME/.pyenv" ]]; then
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    pushd ~/.pyenv
    git checkout v2.3.0
    popd

    # for permanent path, see dot_zshenv
    export PATH=$PATH:$HOME/.pyenv/bin
    eval "$(pyenv init --path)"

    pyenv install -f 3.9.11
    pyenv global 3.9.11
fi
