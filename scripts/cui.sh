#!/bin/bash
set -e

pushd $(dirname $0)

source lib/utils.sh

#------------------------------------
# unzip
#------------------------------------
apt_install unzip unzip

#------------------------------------
# bash
#------------------------------------
sed -i '/\.config\/bash\/bashrc/d' ~/.bashrc
echo "source ~/.config/bash/bashrc" >> ~/.bashrc

#------------------------------------
# git
#------------------------------------
git config --global include.path ~/.config/git/conf.conf
git config --global user.name $CHEZMOI_USERNAME
git config --global user.email $CHEZMOI_EMAIL


#------------------------------------
# devbox
#------------------------------------
## nix
#if should_install nix; then
#    curl -L https://nixos.org/nix/install -o /tmp/nix.sh
#    sh /tmp/nix.sh
#fi
#
## devbox
#if should_install devbox; then
#    curl -fsSL https://get.jetpack.io/devbox -o /tmp/devbox.sh
#    bash /tmp/devbox.sh -f
#fi

#------------------------------------
# zsh
#------------------------------------

apt_install zsh zsh
if [[ "$SHELL" != "$(which zsh)" ]]; then
    chsh -s $(which zsh)
fi

if [[ "$is_init" = true ]]; then
    rm ~/.zgen -rf
fi

if [[ ! -e "$HOME/.zgen" ]]; then
    git clone https://github.com/tarjoilija/zgen.git ~/.zgen
fi

#------------------------------------
# bat
#------------------------------------
apt_install bat bat

#------------------------------------
# exa
#------------------------------------

apt_install exa exa

#------------------------------------
# python
#------------------------------------
sudo apt-get install -y python3 \
    python3-pip \
    python3-venv \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    curl \
    llvm \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    libopencv-dev \
    git \
    python3-tk \
    libgtk-3-dev

# libgtk-3-dev
# https://stackoverflow.com/questions/74834388/ubuntu-configure-wxwidgets-always-gives-error-the-development-files-for-gtk-we

if [[ "$is_init" = true ]]; then
    rm ~/.pyenv -rf
fi

if [[ ! -e "$HOME/.pyenv" ]]; then
    curl https://pyenv.run | bash

    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    pyenv install 3.11.5
    pyenv global 3.11.5
fi

#------------------------------------
# nodejs
#------------------------------------
if should_install npm; then
    sudo apt-get install -y ca-certificates curl gnupg
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

    NODE_MAJOR=20
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

    sudo apt-get update
    sudo apt-get install nodejs -y
fi


#------------------------------------
# neovim
#------------------------------------
if should_install nvim; then
    # ========== neovim ==========
    # https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package

    sudo snap install --beta nvim --classic

    # ========== dependencies ==========

    # required for telescope
    apt_install fd-find fdfind

    # nodejs
    if ! npm ls --location=global | grep neovim >/dev/null; then
        sudo npm install --location=global neovim
    fi
    if [[ "$is_init" = true ]]; then
        sudo npm update -g
    fi

    # python
    if [[ "$is_init" = true ]]; then
        rm ~/.pynvim/ -rf
    fi
    if [[ ! -e "$HOME/.pynvim" ]]; then
        python3 -m venv ~/.pynvim
        ~/.pynvim/bin/pip install -U pip
        ~/.pynvim/bin/pip install pynvim doq
    fi

    # trach-cli
    apt_install trash-cli trash

    # deno
    if [[ "$is_init" = true ]]; then
        rm ~/.local/bin/deno -f
    fi

    if should_install deno; then
        export DENO_INSTALL=~/.local/
        curl -fsSL https://deno.land/install.sh | sh
    fi

    # ripgrep
    apt_install ripgrep rg

    # xclip
    apt_install xclip xclip

    # fzf
    if [[ "$is_init" = true ]]; then
        rm ~/.fzf -rf
    fi

    if [[ ! -e "$HOME/.fzf" ]]; then
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install --no-completion --no-key-bindings --no-update-rc
    fi

    # germanium
    if [[ "$is_init" = true ]]; then
        rm ~/.local/bin/germanium -f
    fi

    if should_install germanium; then
        wget https://github.com/matsuyoshi30/germanium/releases/download/v1.2.2/germanium_1.2.2_linux_x86_64.tar.gz -O /tmp/germanium.tar.gz
        tar -xvf /tmp/germanium.tar.gz -C /tmp/
        mv /tmp/germanium ~/.local/bin
    fi
fi

#------------------------------------
# direnv
#------------------------------------
apt_install direnv direnv

#------------------------------------
# peco
#------------------------------------
if [[ "$is_init" = true ]]; then
    rm ~/.local/bin/peco -f
fi

if should_install peco; then
    wget https://github.com/peco/peco/releases/download/v0.5.10/peco_linux_amd64.tar.gz -O /tmp/peco.tar.gz
    tar -xvf /tmp/peco.tar.gz -C /tmp/
    mv /tmp/peco_linux_amd64/peco ~/.local/bin/
fi

#------------------------------------
# ghq
#------------------------------------
if [[ "$is_init" = true ]]; then
    rm ~/.local/bin/ghq -f
fi

if should_install ghq; then
    wget https://github.com/x-motemen/ghq/releases/download/v1.3.0/ghq_linux_amd64.zip -O /tmp/ghq.zip
    unzip -o /tmp/ghq.zip -d /tmp/
    mv /tmp/ghq_linux_amd64/ghq ~/.local/bin/
fi


#------------------------------------
# gcm
#------------------------------------
if [[ "$is_init" = true ]]; then
    rm ${HOME}/.local/bin/git-credential-manager-core
fi

if should_install git-credential-manager-core; then
    wget https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.785/gcm-linux_amd64.2.0.785.tar.gz -O /tmp/gcm.tar.gz
    mkdir -p /tmp/gcm
    tar -xvf /tmp/gcm.tar.gz -C /tmp/gcm/ 
    mv /tmp/gcm/git-credential-manager-core ${HOME}/.local/bin/

    git-credential-manager-core configure
fi


#------------------------------------
# gpg
#------------------------------------
if [[ "$is_init" = true ]]; then
    rm ~/.gnupg -rf
fi

if [ -z "`ls ${HOME}/.gnupg/openpgp-revocs.d/`" ]; then
    if [ -z "$CONFIG_USER_NAME" ]; then
        echo "CONFIG_USER_NAME is not set"
        echo "use export CONFIG_USER_NAME=your name"
        exit 1
    fi
    if [ -z "$CONFIG_USER_EMAIL" ]; then
        echo "CONFIG_USER_EMAIL is not set"
        echo "use export CONFIG_USER_EMAIL=your name"
        exit 1
    fi

    sudo apt-get install -y pass

    cp $(dirname $0)/../data/gnupg /tmp/gnupg.data

    echo "Name-Real: ${CONFIG_USER_NAME}" >> /tmp/gnupg.data
    echo "Name-Email: ${CONFIG_USER_EMAIL}" >> /tmp/gnupg.data

    cat /tmp/gnupg.data

    gpg --batch --gen-key  /tmp/gnupg.data

    pass init ${CONFIG_USER_EMAIL}

    #gpg --export -a ${CONFIG_USER_EMAIL}

    #echo "register the key to github and gitlab"
fi

#------------------------------------
# docker
#------------------------------------
if [[ "$is_init" = true ]]; then
  sudo apt-get remove -y docker docker.io containerd runc
fi


if should_install docker; then

  sudo apt-get install -y \
      ca-certificates \
      curl \
      gnupg \
      lsb-release
  
  sudo mkdir -p /etc/apt/keyrings
  
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  
  #if [[ -e "/etc/linuxmint" ]]; then
  #  echo "OS: linuxmint"
  #  echo \
  #  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu\
  #  focal stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  #else
  #  echo "OS: ubuntu"
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  #fi

  sudo apt-get update

  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

  # dockerをsudoなしで実行できるようにする
  sudo gpasswd -a ${USER} docker
  sudo systemctl restart docker
fi

#------------------------------------
# openssh server
#------------------------------------
apt_install openssh-server sshd

popd
