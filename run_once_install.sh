#!/bin/bash
set -xe

# is_init が定義されていない場合は is_init = falseとする
export is_init=${is_init:-false}

echo "is_init: ${is_init}"

all=false
gui=false
while [ $# -gt 0 ]; do
    case ${1} in
        --all)
            all=true
            echo "set mode: all install"
        ;;
        --gui)
            gui=true
            echo "set mode: gui"
        ;;
        --help)
            echo "there is no help. read run_once_install.sh"
            exit
        ;;
        *) ;;
    esac
    shift
done


if [[ "$is_init" = true ]]; then
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
fi

cd ~/.local/share/chezmoi/
mkdir -p ~/.local/bin

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y autoremove

# common
sudo apt-get install -y software-properties-common unzip

# git
./scripts/git.sh

# japanese font
sudo apt-get install -y fontconfig fonts-ipaexfont

# zsh
./scripts/zsh.sh

# ghq
./scripts/ghq.sh

# peco
./scripts/peco.sh

# llvm
./scripts/llvm.sh

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

# docker-cli
#./scripts/docker-cli.sh

# gnupg
# 最後が良さそう
./scripts/gnupg.sh

all=false
gui=false
while [ $# -gt 0 ]; do
    case ${1} in
        --imod)
            echo "extra install: imod"
            ./scripts/imod.sh
        ;;
        --docker)
            echo "extra install: docker"
            ./scripts/docker-cli.sh
        ;;
        *) ;;
    esac
    shift
done

if [[ "$gui"  = true ]]; then
    ./scripts/appimagelauncher.sh
    ./scripts/chrome.sh
    ./scripts/code.sh
    ./scripts/discord.sh
    ./scripts/dropbox.sh
    ./scripts/firefox.sh
    ./scripts/spotify.sh
    ./scripts/typora.sh
    ./scripts/biscuit.sh
fi

echo "finish"
