#!/bin/bash

is_all_install="false"
while [ $# -gt 0 ]; do
    case ${1} in
        --all)
            is_all_install="true"
        ;;
        *) ;;
    esac
    shift
done

echo "is_all_install $is_all_install"

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y autoremove

# linuxbrew
if ! type brew >/dev/null 2>&1; then
    echo "[install] linuxbrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
    echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
fi

brew update

# python関係
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
if ! type pyenv >/dev/null 2>&1; then
    brew install pyenv
    pyenv install -f 3.8.10
    pyenv global 3.8.10
fi

if ! type pipenv >/dev/null 2>&1; then
    brew install pipenv
fi


# nodejs
if ! type npm >/dev/null 2>&1; then
    sudo apt-get instal -y nodejs npm
    sudo npm install -g n
    sudo n stable
    sudo apt-get remove -y --purge nodejs npm
fi

# git
sudo apt-get remove -y --purge git
brew install git

# # direnv
brew install direnv

# neovim環境構築
if ! type nvim >/dev/null 2>&1; then
    brew install neovim

    sudo npm install -g neovim
    mkdir -p ~/python_envs/nvim/
    cd ~/python_envs/nvim/
    pipenv install pynvim

    brew install deno fzf xclip

    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
    sh ~/installer.sh ~/.cache/dein
    rm ~/installer.sh
fi

# starship
brew install starship exa bat

# openMPI
if [[ "$is_all_install" = true ]]; then
    sudo mkdir /opt/openMPI
    sudo rm /opt/openMPI/* -rf
    sudo apt-get install build-essential gfortran
    curl https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.2.tar.gz --output ~/openmpi.tar.gz 
    tar -xvf ~/openmpi.tar.gz -C ~
    rm ~/openmpi.tar.gz
    cd ~/openmpi-4.1.2/
    ./configure --prefix=/opt/openMPI CC=gcc CXX=g++ F77=gfortran FC=gfortran
    make -j
    sudo make install
fi
