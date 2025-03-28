#!/bin/bash
set -xe

if [[ "$is_init" = true ]]; then
    rm ~/.local/bin/germanium -f
fi

if ! type germanium > /dev/null 2>&1; then
    wget https://github.com/matsuyoshi30/germanium/releases/download/v1.2.2/germanium_1.2.2_linux_x86_64.tar.gz -O /tmp/germanium.tar.gz
    tar -xvf /tmp/germanium.tar.gz -C /tmp/
    mv /tmp/germanium ~/.local/bin
fi
