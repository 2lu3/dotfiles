#!/bin/bash
set -xe

if ! type dropbox > /dev/null 2>&1; then
    wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb -O /tmp/dropbox.deb
    sudo apt-get install -y /tmp/dropbox.deb
    
    wget https://www.dropbox.com/download?dl=packages/dropbox.py -O ~/dropbox.py
fi
