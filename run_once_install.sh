#!/bin/bash
set -xe

cd ~/.local/share/chezmoi/

# bash
sed -i '/\.config\/bash\/bashrc/d' ~/.bashrc
echo "source ~/.config/bash/bashrc" >> ~/.bashrc

# linuxbrew
source ./scripts/linuxbrew.sh

# git
./scripts/git.sh

# japanese font
./scripts/font.sh

# zsh
./scripts/zsh.sh

# llvm
brew install llvm

# pyenv
./scripts/conda.sh

# nodejs
source ./scripts/nodejs.sh


# neovim
./scripts/neovim.sh
brew install deno
./scripts/fzf.sh
brew install ripgrep
brew install xclip
./scripts/germanium.sh

# 便利ツール
brew install bat exa direnv peco ghq

./scripts/gcm.sh

# ruby
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
