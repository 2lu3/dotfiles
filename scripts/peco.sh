#!/bin/bash
set -xe

# https://github.com/peco/peco

# 最新バージョンをインストールしている

wget https://github.com/peco/peco/releases/download/v0.5.10/peco_linux_amd64.tar.gz -O /tmp/peco.tar.gz
tar -xvf /tmp/peco.tar.gz -C /tmp/
mv /tmp/peco_linux_amd64/peco ~/.local/bin/