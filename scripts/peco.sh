#!/bin/bash
set -xe

# https://github.com/peco/peco

# 最新バージョンをインストールしている

wget https://github.com/peco/peco/releases/download/v0.5.10/peco_linux_amd64.tar.gz
tar -xvf peco_linux_amd64.tar.gz
mv ./peco_linux_amd64/peco ~/.local/bin/
rm peco_linux_amd64.tar.gz
rm peco_linux_amd64 -r
