#!/bin/bash
set -xe

cd ~/.local/share/chezmoi/

export PATH="$PATH:${HOME}/.local/bin"

./scripts/minimum.sh

echo "finish"
