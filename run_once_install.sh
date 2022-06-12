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

cd ~/.local/share/chezmoi/

mkdir -p ~/.local/bin
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
# v16がLTSのため
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs


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
sudo apt-get install -y bat

# exa
./scripts/exa.sh

# Git Credential Manager for Linux
./scripts/gcm.sh

# wslでwindowsのpathを引き継がない
sudo sh -c "(echo \"[interop]\"; echo \"appendWindowsPath = false\") > /etc/wsl.conf"

if [[ "$is_gui"  = true ]]; then
    ./scripts/chrome.sh
    ./scripts/code.sh
    ./scripts/discord.sh
    ./scripts/dropbox.sh
    ./scripts/firefox.sh
    ./scripts/spotify.sh
    ./scripts/typora.sh
fi

echo "finish"
