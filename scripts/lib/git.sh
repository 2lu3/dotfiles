#!/bin/bash
set -xe

git config --global include.path ~/.config/git/conf.conf
git config --global user.name ${CONFIG_USER_NAME}
git config --global user.email ${CONFIG_USER_EMAIL}

curl -fsSL https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install -y git-lfs
