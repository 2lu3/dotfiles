#!/bin/bash
set -xe


if [[ -e "$HOME/.chezmoi_norun" ]]; then
    exit
fi

# is_init が定義されていない場合は is_init = falseとする
export is_init=${is_init:-false}

echo "is_init: ${is_init}"

all=false
gui=false
imod=false
docker=false
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
        --imod)
            echo "extra install: imod"
            imod=true
        ;;
        --docker)
            echo "extra install: docker"
            docker=true
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
#mkdir -p ~/.local/bin

# linuxbrew
./scripts/linuxbrew.sh

# git
./scripts/git.sh

# japanese font
./scripts/font.sh

# zsh
./scripts/zsh.sh

# ghq
brew install ghq

# peco
brew install peco

# llvm
brew install llvm

# pyenv
./scripts/pyenv.sh

# nodejs
./scripts/nodejs.sh

# neovim
./scripts/neovim.sh
brew install deno
#./scripts/deno.sh
./scripts/fzf.sh
brew install ripgrep
#./scripts/ripgrep.sh
#sudo apt-get install -y xclip
brew install xclip


# germanium
#./scripts/germanium.sh
brew install germanium

# direnv
#./scripts/direnv.sh
brew install direnv

# bat
#./scripts/bat.sh
brew install bat

# exa
#./scripts/exa.sh
brew install exa

# Git Credential Manager for Linux
#./scripts/gcm.sh
brew install gcm

# ruby
#./scripts/ruby.sh
brew install ruby

# docker-cli
if [[ "$docker" = true ]]; then
    ./scripts/docker-cli.sh
fi

# imod
if [[ "$imod" = true ]]; then
    ./scripts/imod.sh
fi

# gnupg
# 最後が良さそう
./scripts/gnupg.sh

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
    ./scripts/run_scaled.sh
fi

echo "finish"
