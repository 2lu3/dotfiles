#!/bin/bash
set -xe

# https://github.com/direnv/direnv/blob/master/docs/installation.md#from-binary-builds

export bin_path=~/.local/bin
curl -sfL https://direnv.net/install.sh | bash
