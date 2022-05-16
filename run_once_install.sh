#!/bin/bash
set -xe

is_all_install=false
is_docker=false
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
        *) ;;
    esac
    shift
done

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y autoremove

# zsh
sudo apt-get install -y zsh
sudo chsh -s $(which zsh) ${SUDO_USER}

sudo apt-get install -y git

# pyenv
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
if [[ ! -e "$HOME/.pyenv" ]]; then
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    pushd ~/.pyenv
    git checkout v2.3.0
    popd

    pyenv install -f 3.9.11
    pyenv global 3.9.11
fi

# nodejs
if ! type n >/dev/null 2>&1; then
    sudo apt-get install -y nodejs npm
    sudo npm install -g n
    sudo n stable
    sudo apt-get purge --auto-remove -y nodejs npm
fi

# ninja
if ! type ninja >/dev/null 2>&1; then
    apt-get install -y ninja-build
fi

# typora
if ! type typora > /dev/null 2>&1; then
    wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
    sudo add-apt-repository 'deb https://typora.io/linux ./'
    sudo apt-get install -y typora
fi

# linuxbrew
sudo apt-get install -y build-essential procps curl file git
if ! type brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

# chezmoi
brew install chezmoi

# go
brew install go

# neovim
brew install neovim deno fzf xclip ripgrep
sudo npm install -g neovim
# pynvim
if [[ ! -e "$HOME/python_envs/nvim" ]]; then
    mkdir -p ~/app/pynvim
    python3 -m venv ~/app/pynvim/
    ~/app/pynvim/bin/pip3 -U pip
    ~/app/pynvim/bin/pip3 install pynvim
fi
# dein
if [[ ! -e "$HOME/.cache/dein/" ]]; then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
    sh ~/installer.sh ~/.cache/dein
    rm ~/installer.sh
fi

brew install direnv starship exa bat

# germanium
if ! type germanium > /dev/null 2>&1; then
    git clone https://github.com/matsuyoshi30/germanium /tmp/germanium
    pushd /tmp/germanium/cmd/germanium 
    go install
    popd
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
#if ! type git-credential-manager-core >/dev/null 2>&1; then
#    install_log "git credential manager for linux"
#    apt_install pass
#    curl -LO https://raw.githubusercontent.com/GitCredentialManager/git-credential-manager/main/src/linux/Packaging.Linux/install-from-source.sh > ~/install-from-source.sh
#    sh ~/install-from-source.sh
#    git-credential-manager-core configure
#fi


