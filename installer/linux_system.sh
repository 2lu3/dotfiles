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

apt-get update
apt-get -y upgrade
apt-get -y autoremove

# linuxbrew
apt-get install -y build-essential procps curl file git
mkdir -p /home/linuxbrew/.linuxbrew
if "${is_docker}";then
    chwon -R ${USERNAME}:${USERNAME} /home/linuxbrew/.linuxbrew
else
    chwon -R ${SUDO_USER}:${SUDO_USER} /home/linuxbrew/.linuxbrew
fi

# zsh
apt-get install -y zsh
if "${is_docker}";then
    chsh -s $(which zsh) ${USERNAME}
else
    chsh -s $(which zsh) ${SUDO_USER}
fi

# pyenv
apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# nodejs
if ! type n >/dev/null 2>&1; then
    apt-get install -y nodejs npm
    npm install -g n
    n stable
    apt-get purge --auto-remove -y nodejs npm
fi


# ninja
if ! type ninja >/dev/null 2>&1; then
    apt-get install -y ninja-build
fi

# typora
if ! type typora > /dev/null 2>&1; then
    wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
    add-apt-repository 'deb https://typora.io/linux ./'
    apt-get install -y typora
fi

