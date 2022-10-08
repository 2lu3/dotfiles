#!/bin/bash
set -xe


if [[ "$is_init" = true ]]; then
    sudo apt-get remove -y code
fi

if ! type code > /dev/null 2>&1; then
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg

    sudo apt-get -y install apt-transport-https
    sudo apt-get -y update
    sudo apt-get -y install code 
    #sudo snap install code
fi
