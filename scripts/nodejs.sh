#!/bin/bash
set -xe

if ! type npm > /dev/null 2>&1; then
    # v16がLTSのため v16をえらんだ
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi
