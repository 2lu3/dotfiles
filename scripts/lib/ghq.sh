#!/bin/bash
set -xe

wget https://github.com/x-motemen/ghq/releases/download/v1.3.0/ghq_linux_amd64.zip -O /tmp/ghq.zip
unzip -o /tmp/ghq.zip -d /tmp/
mv /tmp/ghq_linux_amd64/ghq ~/.local/bin/
