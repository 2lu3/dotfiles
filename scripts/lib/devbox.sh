#!/bin/bash
set -xe

pushd $(dirname $0)
source ./utils.sh

# nix
if should_install nix; then
    curl -L https://nixos.org/nix/install -o /tmp/nix.sh
    sh /tmp/nix.sh
fi

# devbox
if should_install devbox; then
    curl -fsSL https://get.jetpack.io/devbox -o /tmp/devbox.sh
    bash /tmp/devbox.sh -f
fi

popd
