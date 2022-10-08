#!/bin/bash
set -xe

# https://github.com/pyenv/pyenv#basic-github-checkout

brew install pyenv
pyenv install -f 3.9.11
pyenv global 3.9.11
