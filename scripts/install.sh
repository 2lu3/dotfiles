#!/bin/bash
set -xe

is_all_install=false
is_docker=false
is_gui=false
while [ $# -gt 0 ]; do
    case ${1} in
        --all)
            is_all_install=true
            echo "set mode: all install"
        ;;
        --docker)
            is_docker=true
            echo  "set mode: docker"
        ;;
        --gui)
            is_gui=true
            echo "set mode: gui"
        ;;
        *) ;;
    esac
    shift
done

cd $(dirname $0)

mkdir -p ~/.local/bin

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y autoremove

# common
sudo apt-get install -y git software-properties-common

# japanese font
sudo apt-get install -y fontconfig fonts-ipaexfont

# zsh
sudo apt-get install -y zsh
sudo chsh -s $(which zsh) ${USER}

# go
source ./lib/go.sh

# ghq
go install github.com/x-motemen/ghq@latest

# peco
./lib/peco.sh

# pyenv
source ./lib/pyenv.sh

# nodejs
# v16がLTSのため
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs


# neovim
./lib/neovim.sh
./lib/deno.sh
./lib/fzf.sh
./lib/ripgrep.sh
sudo apt-get install -y xclip


# germanium
./lib/germanium.sh

# direnv
./lib/direnv.sh

# exa bat
sudo apt-get install -y exa bat

# Git Credential Manager for Linux
./lib/gcm.sh

# wslでwindowsのpathを引き継がない
sudo sh -c "(echo \"[interop]\"; echo \"appendWindowsPath = false\") > /etc/wsl.conf"

if [[ "$is_gui"  = true ]]; then
    ./lib/chrome.sh
    ./lib/code.sh
    ./lib/discord.sh
    ./lib/dropbox.sh
    ./lib/firefox.sh
    ./lib/spotify.sh
    ./lib/typora.sh
fi

echo "finish"
