##!/bin/bash
#set -xe
#
## bash -c "$(curl -fsLS https://raw.githubusercontent.com/2lu3/dotfiles/main/init.sh)"
#
#if [ "`echo $PATH | grep '/mnt/c/'`" ]; then
#    # wslでwindowsのpathを引き継がないようにする
#    sudo sh -c "(echo \"[interop]\"; echo \"appendWindowsPath = false\") > /etc/wsl.conf"
#    echo "using windows path from wsl is disabled now"
#    echo "please run 'wsl --shutdown' in your command prompt and run this code again"
#    exit 1
#fi
#
#export is_init=true
#
## chezmoi のリセット
#if type chezmoi > /dev/null 2>&1; then
#    chezmoi state reset
#fi
#rm ~/.local/share/chezmoi -rf
#mkdir -p ~/.local/
#
## 初回インストール時はここにpathが通されていないため
#export PATH=$PATH:${HOME}/.local/bin
#
#
#sudo apt install -y git wget build-essential
#
#pushd ~/.local/
#wget https://chezmoi.io/get -O /tmp/chezmoi.sh
#/bin/bash /tmp/chezmoi.sh init --apply 2lu3
#popd
