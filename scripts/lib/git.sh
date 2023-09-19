#!/bin/bash
set -xe

source ./lib/utils.sh

git config --global include.path ~/.config/git/conf.conf
git config --global user.name ${CONFIG_USER_NAME}
git config --global user.email ${CONFIG_USER_EMAIL}

if should_install "git lfs"; then
    curl -fsSL https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
    apt_install git-lfs
fi
