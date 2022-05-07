#!/bin/bash
set -xe

# linuxbrew
if ! type brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

# chezmoi
brew install chezmoi

# pyenv
brew install pyenv

# python
#FLAGS=-I/usr/include/openssl LDFLAGS=-L/usr/lib pyenv install -v -f 3.9.11
pyenv install -v -f 3.9.11
pyenv global 3.9.11

# go
brew install go

brew install direnv starship exa bat

# neovim
brew install neovim deno fzf xclip ripgrep
npm install -g neovim
# pynvim
if [[ ! -e "$HOME/python_envs/nvim" ]]; then
    mkdir -p ~/python_envs/
    python -m venv ~/python_envs/nvim/
    ~/python_envs/nvim/bin/pip3 -U pip
    ~/python_envs/nvim/bin/pip3 install pynvim
fi
# dein
if [[ ! -e "$HOME/.cache/dein/" ]]; then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
    sh ~/installer.sh ~/.cache/dein
    rm ~/installer.sh
fi

# germanium
git clone https://github.com/matsuyoshi30/germanium /tmp/germanium
cd /tmp/germanium/cmd/germanium && go install

