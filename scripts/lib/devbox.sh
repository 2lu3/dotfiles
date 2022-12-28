#!/bin/bash
set -xe

# nix
curl -L https://nixos.org/nix/install -o /tmp/nix.sh
sh /tmp/nix.sh

# devbox
curl -fsSL https://get.jetpack.io/devbox -o /tmp/devbox.sh
bash /tmp/devbox.sh -f
