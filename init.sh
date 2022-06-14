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

# true=初期化、以下の条件を満たすようにシェルスクリプトを書く
# 1. 以前のインストール処理が途中で異常終了されてもOK
# 2. 古いバージョンをインストールしている場合は、アップデートすること
export is_init=true

# chezmoi のリセット
rm ~/.local/share/chezmoi -rf

mkdir -p ~/.local/

# 初回インストール時はここにpathが通されていないため
export PATH=$PATH:${HOME}/.local/bin

pushd ~/.local/

wget https://chezmoi.io/get -O /tmp/chezmoi.sh
chmod +x /tmp/chezmoi.sh
/tmp/chezmoi.sh init --apply 2lu3

popd
