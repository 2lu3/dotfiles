#!/bin/bash
set -xe


sudo apt-get install -y bat
if [[ ! -e "$HOME/.local/bin/bat" ]]; then
    ln -s /usr/bin/batcat ~/.local/bin/bat
fi
