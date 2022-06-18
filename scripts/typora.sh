#!/bin/bash
set -xe

if ! type typora > /dev/null 2>&1; then
    wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
    sudo add-apt-repository 'deb https://typora.io/linux ./'
    sudo apt-get update
    sudo apt-get install -y typora
fi
