#!/bin/bash
set -xe

# bash -c "$(curl -fsLS https://raw.githubusercontent.com/2lu3/dotfiles/main/init.sh)"

if [ "`echo $PATH | grep '/mnt/c/'`" ]; then
    # wslでwindowsのpathを引き継がないようにする
    sudo sh -c "(echo \"[interop]\"; echo \"appendWindowsPath = false\") > /etc/wsl.conf"
    echo "using windows path from wsl is disabled now"
    echo "please run 'wsl --shutdown' in your command prompt and run this code again"
    exit
fi

# chezmoi のリセット
rm ~/.local/share/chezmoi -rf

mkdir -p ~/.local/

pushd ~/.local/
wget https://chezmoi.io/get -O /tmp/chezmoi.sh
chmod +x /tmp/chezmoi.sh
/tmp/chezmoi.sh init --apply 2lu3
popd
