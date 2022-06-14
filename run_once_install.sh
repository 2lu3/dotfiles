#!/bin/bash
set -xe

all=false
gui=false
while [ $# -gt 0 ]; do
    case ${1} in
        --all)
            is_all_install=true
            echo "set mode: all install"
        ;;
        --gui)
            is_gui=true
            echo "set mode: gui"
        ;;
        *) ;;
    esac
    shift
done


if [ -z "$CONFIG_USER_NAME" ]; then
    echo "CONFIG_USER_NAME is not set"
    echo "use export CONFIG_USER_NAME=your name"
    exit
fi
if [ -z "$CONFIG_USER_EMAIL" ]; then
    echo "CONFIG_USER_EMAIL is not set"
    echo "use export CONFIG_USER_EMAIL=your name"
    exit
fi

cd ~/.local/share/chezmoi/

mkdir -p ~/.local/bin
# 初回インストール時はここにpathが通されていないため
export PATH=$PATH:${HOME}/.local/bin

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y autoremove

# common
sudo apt-get install -y git software-properties-common unzip

# japanese font
sudo apt-get install -y fontconfig fonts-ipaexfont

# zsh
./scripts/zsh.sh

# ghq
./scripts/ghq.sh

# peco
./scripts/peco.sh

# pyenv
source ./scripts/pyenv.sh

# nodejs
./scripts/nodejs.sh

# neovim
./scripts/neovim.sh
./scripts/deno.sh
./scripts/fzf.sh
./scripts/ripgrep.sh
sudo apt-get install -y xclip


# germanium
./scripts/germanium.sh

# direnv
./scripts/direnv.sh

# bat
./scripts/bat.sh

# exa
./scripts/exa.sh

# Git Credential Manager for Linux
./scripts/gcm.sh

if [[ "$gui"  = true ]]; then
    ./scripts/chrome.sh
    ./scripts/code.sh
    ./scripts/discord.sh
    ./scripts/dropbox.sh
    ./scripts/firefox.sh
    ./scripts/spotify.sh
    ./scripts/typora.sh
fi

echo "finish"
