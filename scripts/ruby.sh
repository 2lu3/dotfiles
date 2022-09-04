#!/bin/bash
set -xe

# 参考記事: https://qiita.com/kerupani129/items/77dd1e3390b53f4e97b2

if [[ "$is_init" = true ]]; then
    rm ~/.rbenv -rf
fi


if ! type rbenv > /dev/null 2>&1; then
    sudo apt-get install -y gcc make
    sudo apt-get install -y libssl-dev zlib1g-dev
    git clone --depth 1 https://github.com/rbenv/rbenv.git ~/.rbenv 
    cd ~/.rbenv && src/configure && make -C src

    git clone --depth 1 https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

    rbenv install 3.1.2
    rbenv global 3.1.2
fi

