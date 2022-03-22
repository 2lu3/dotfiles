#!/bin/bash

function brew_install() {
    for N in "${@}";
    do
        if ! type $N > /dev/null 2>&1; then
            brew_install_log ${N}
            brew install $N
        fi
    done
}

function apt_install() {
    for N in "${@}";
    do
        if ! type $N > /dev/null 2>&1; then
            apt_install_log $N
            sudo apt-get install -y $N
        fi
    done
}

function print_colored() {
    ESCAPE=$(printf '\033') # \e や \x1bまたは$'\e'は使用しない
    for N in "${@}";
    do
        printf "${ESCAPE}[31m%s ${ESCAPE}[m\n" $N
    done
}

function apt_install_log() {
    for N in "${@}";
    do
        print_colored "[apt install] $N"
    done
}
function brew_install_log() {
    for N in "${@}";
    do
        print_colored "[brew install] $N"
    done
}

function install_log() {
    for N in "${@}";
    do
        print_colored "[install] $N"
    done
}

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
    install_log linuxbrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bash_profile
    echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile
fi

brew update

# python関係
if ! type pyenv >/dev/null 2>&1; then
    apt_install make build-essential libssl-dev zlib1g-dev \
        libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
        libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
    brew install pyenv
    pyenv install -f 3.8.10
    pyenv global 3.8.10
fi

if ! type pipenv >/dev/null 2>&1; then
    brew install pipenv
fi


# nodejs
if ! type npm >/dev/null 2>&1; then
    apt_install nodejs npm
    install_log "[npm install] npm"
    sudo npm install -g n
    sudo n stable
    sudo apt-get purge -y nodejs npm
fi

# git

sudo apt-get remove -y --purge git
brew_install git

brew_install direnv
brew_install starship exa bat

# neovim環境構築
if ! type nvim >/dev/null 2>&1; then
    brew_install neovim deno fzf xclip

    sudo npm install -g neovim
    if ! [ -e '~/python_envs/nvim' ]; then
        mkdir -p ~/python_envs/nvim/
        cd ~/python_envs/nvim/
        pipenv install pynvim
    fi

    if ! [ -e '~/.cache/dein' ]; then
        curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
        sh ~/installer.sh ~/.cache/dein
        rm ~/installer.sh
    fi
fi


# openMPI
if [[ "$is_all_install" = true ]]; then
    install_log openMPI
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

# Git Credential Manager for Linux
if ! type git-credential-manager-core >/dev/null 2>&1; then
    install_log "git credential manager for linux"
    curl -LO https://raw.githubusercontent.com/GitCredentialManager/git-credential-manager/main/src/linux/Packaging.Linux/install-from-source.sh &&
    sh ./install-from-source.sh &&
    git-credential-manager-core configure
fi

# Cuda Toolkit
#if [[ "$is_all_install" = true ]]; then
#    wget https://developer.download.nvidia.com/compute/cuda/11.2.2/local_installers/cuda_11.2.2_460.32.03_linux.runsudo ~/cuda.run
#    sh ~/cuda.run
#    rm  ~/cuda.run
#fi
