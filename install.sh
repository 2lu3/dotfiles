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

# zsh
sudo apt-get install -y zsh
sudo chsh -s $(which zsh) ${USER}

# go
./scripts/go.sh
export PATH=$PATH:/usr/local/go/bin

# ghq
go install github.com/x-motemen/ghq@latest

# peco
./scripts/peco.sh

# pyenv
./scripts/pyenv.sh

# nodejs
# v16がLTSのため
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# chezmoi
./scripts/chezmoi.sh

# neovim
./scripts/neovim.sh
./scripts/deno.sh
./scripts/fzf.sh
./scripts/ripgrep.sh
sudo apt-get install -y xclip


# germanium
./scripts germanium

# direnv
./scripts/direnv.sh

# exa bat
sudo apt-get install -y exa bat

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
