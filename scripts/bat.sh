#!/bin/bash
set -xe

if [[ "$is_init" = true ]]; then
    sudo apt-get remove -y bat
fi

if ! type bat > /dev/null 2>&1; then
    wget https://github.com/sharkdp/bat/releases/download/v0.21.0/bat_0.21.0_amd64.deb -O /tmp/bat.deb
    sudo dpkg -i /tmp/bat.deb
fi
