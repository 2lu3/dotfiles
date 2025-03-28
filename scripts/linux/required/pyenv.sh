#!/bin/bash

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

if [[ ! -e "$HOME/.pyenv" ]]; then
    curl https://pyenv.run | bash

    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    pyenv install 3.11.5
    pyenv global 3.11.5
fi

