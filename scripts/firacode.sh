#!/bin/bash
set -xe

pushd ~/.local/share/chezmoi/
mkdir -p ~/.local/share/fonts/
cp ./firacode.ttf ~/.local/share/fonts/
popd

