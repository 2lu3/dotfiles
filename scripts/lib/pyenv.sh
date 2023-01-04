#!/bin/bash
set -xe

# https://github.com/pyenv/pyenv#basic-github-checkout

sudo apt-get update
sudo apt-get install -y build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

if [[ "$is_init" = true ]]; then
    if [[ -e "$HOME/.pyenv" ]]; then
        rm ~/.pyenv -rf
    fi
fi

if [[ ! -e "$HOME/.pyenv" ]]; then
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv

    pushd ~/.pyenv
    src/configure
    make -C src
    popd

    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    pyenv install 3.10.9
    pyenv global 3.10.9
fi
