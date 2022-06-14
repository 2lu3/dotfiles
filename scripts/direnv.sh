#!/bin/bash
set -xe

# https://github.com/direnv/direnv/blob/master/docs/installation.md#from-binary-builds

if [[ "$is_init" = true ]]; then
    rm ~/.local/bin/direnv -f
fi

if ! type direnv > /dev/null 2>&1; then
    if [ -z "$CONFIG_USER_NAME" ]; then
        echo "CONFIG_USER_NAME is not set"
        echo "use export CONFIG_USER_NAME=your name"
        exit
    fi
    if [ -z "$CONFIG_USER_EMAIL" ]; then
        echo "CONFIG_USER_EMAIL is not set"
        echo "use export CONFIG_USER_EMAIL=your name"
        exit
    fi
    export bin_path=~/.local/bin
    curl -sfL https://direnv.net/install.sh | bash
fi
