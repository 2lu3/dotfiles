#!/bin/bash
set -xe

cd ~/.local/share/chezmoi/

# linuxbrew
source ./scripts/linuxbrew.sh

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
./scripts/conda.sh
#./scripts/pyenv.sh

# nodejs
source ./scripts/nodejs.sh


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
#if [[ "$docker" = true ]]; then
#    ./scripts/docker-cli.sh
#fi

# imod
#if [[ "$imod" = true ]]; then
#    ./scripts/imod.sh
#fi

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
