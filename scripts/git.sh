#!/bin/bash
set -xe

sudo apt-get install -y git

if [[ "$is_init" = true ]]; then
    git config --global --replace-all include.path ~/.config/git/conf.conf
    git config --global user.name ${CONFIG_USER_NAME}
    git config --global user.email ${CONFIG_USER_EMAIL}
fi
