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

mkdir -p ~/.local/bin

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y autoremove

# common
sudo apt-get install -y git software-properties-common

# zsh
sudo apt-get install -y zsh
sudo chsh -s $(which zsh) ${USER}

# go
./lib/go.sh
export PATH=$PATH:/usr/local/go/bin

# ghq
go install github.com/x-motemen/ghq@latest

# peco
./lib/peco.sh

# pyenv
./lib/pyenv.sh

# nodejs
# v16がLTSのため
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# ninja
sudo apt-get install -y ninja-build

# chezmoi
./lib/chezmoi.sh

# neovim
./lib/neovim.sh
./lib/deno.sh
./lib/fzf.sh
./lib/ripgrep.sh
sudo apt-get install -y xclip

# japanese font
sudo apt-get install -y fontconfig fonts-ipaexfont

./lib/direnv.sh
sudo apt-get install -y exa bat

# germanium
./lib germanium

if [[ "$is_gui"  = true ]]; then
    ./lib/chrome.sh
    ./lib/code.sh
    ./lib/discord.sh
    ./lib/dropbox.sh
    ./lib/firefox.sh
    ./lib/spotify.sh
    ./lib/typora.sh
fi


## openMPI
#if [[ "$is_all_install" = true ]]; then
#    install_log openMPI
#    sudo mkdir /opt/openMPI
#    sudo rm /opt/openMPI/* -rf
#    sudo apt-get install build-essential gfortran
#    curl https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.2.tar.gz --output ~/openmpi.tar.gz
#    tar -xvf ~/openmpi.tar.gz -C ~
#    rm ~/openmpi.tar.gz
#    cd ~/openmpi-4.1.2/
#    ./configure --prefix=/opt/openMPI CC=gcc CXX=g++ F77=gfortran FC=gfortran
#    make -j
#    sudo make install
#fi

# Git Credential Manager for Linux
./lib/gcm.sh

# wslでwindowsのpathを引き継がない
sudo sh -c "(echo \"[interop]\"; echo \"appendWindowsPath = false\") > /etc/wsl.conf"

echo "finish"
