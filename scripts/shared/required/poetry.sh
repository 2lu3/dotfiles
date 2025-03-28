#!/bin/bash

# require: pyenv

if ! type poetry > /dev/null 2>&1; then
    echo "poetry is not installed"
    echo "installing poetry"
    curl -sSL https://install.python-poetry.org | python3 -
else
    echo "poetry is already installed"
fi
