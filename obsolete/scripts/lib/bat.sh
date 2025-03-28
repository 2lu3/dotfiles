#!/bin/bash
set -xe


if should_install bat; then
    wget https://github.com/sharkdp/bat/releases/download/v0.21.0/bat_0.21.0_amd64.deb -O /tmp/bat.deb
    sudo apt-get install -y /tmp/bat.deb
fi
