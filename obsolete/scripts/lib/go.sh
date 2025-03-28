#!/bin/bash
set -xe

# https://go.dev/doc/install

sudo rm -rf /usr/local/go

wget https://go.dev/dl/go1.18.3.linux-amd64.tar.gz -O /tmp/go.tar.gz
sudo tar -C /usr/local -xzf /tmp/go.tar.gz

export PATH=$PATH:/usr/local/go/bin
