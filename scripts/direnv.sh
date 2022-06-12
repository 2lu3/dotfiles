#!/bin/bash
set -xe

# https://github.com/direnv/direnv/blob/master/docs/installation.md#from-binary-builds

if ! type direnv > /dev/null 2>&1; then
    export bin_path=~/.local/bin
    curl -sfL https://direnv.net/install.sh | bash
fi
