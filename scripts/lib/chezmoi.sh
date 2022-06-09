#!/bin/bash
set -xe

mkdir -p ~/.local
pushd ~/.local
sh -c "$(curl -fsLS chezmoi.io/get)"
popd
