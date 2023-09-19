#!/bin/bash

pushd $(dirname $0)

source lib/utils.sh


# bash
sed -i '/\.config\/bash\/bashrc/d' ~/.bashrc
echo "source ~/.config/bash/bashrc" >> ~/.bashrc


git config --global include.path ~/.config/git/conf.conf
git config --global user.name ${CONFIG_USER_NAME}
git config --global user.email ${CONFIG_USER_EMAIL}

popd
