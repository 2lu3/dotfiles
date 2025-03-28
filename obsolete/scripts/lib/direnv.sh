#!/bin/bash
set -xe

# https://github.com/direnv/direnv/blob/master/docs/installation.md#from-binary-builds
#
sudo apt-get install -y direnv

#if [[ "$is_init" = true ]]; then
#    rm ~/.local/bin/direnv -f
#fi
#
#if ! type direnv > /dev/null 2>&1; then
#    export bin_path=~/.local/bin
#    curl -sfL https://direnv.net/install.sh | bash
#fi
