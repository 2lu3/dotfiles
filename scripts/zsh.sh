#!/bin/bash
set -xe

sudo apt-get install -y zsh
sudo chsh -s $(which zsh) ${USER}


# zgen
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
