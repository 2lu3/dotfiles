#!/bin/bash
set -xe

if ! type biscuit > /dev/null 2>&1; then
    wget https://github.com/agata/dl.biscuit/releases/download/v1.2.27/Biscuit-1.2.27.AppImage -O ~/.local/bin/biscuit
    chmod u+x ~/.local/bin/biscuit
fi
