#!/bin/bash
set -xe

wget https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip -O /tmp/exa.zip
unzip -o /tmp/exa.zip -d /tmp/
mv /tmp/bin/exa ~/.local/bin/
