#!/bin/bash
set -xe

if [[ "$is_init" = true ]]; then
    sudo apt-get remove -y nodejs
fi

if ! type npm > /dev/null 2>&1; then
    # v16がLTSのため v16をえらんだ
    wget https://deb.nodesource.com/setup_16.x -O /tmp/nodejs.sh
    sudo -E bash  /tmp/nodejs.sh
    sudo apt-get install -y nodejs
fi
