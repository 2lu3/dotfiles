#!/bin/bash
set -xe

if ! type biscuit > /dev/null 2>&1; then
    wget https://github.com/agata/dl.biscuit/releases/latest -O ~/.local/bin/biscuit
    chmod +x ~/.local/bin/biscuit
fi
