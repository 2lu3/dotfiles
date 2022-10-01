#!/bin/bash
set -xe

# https://gist.github.com/woods/8970150
# https://www.gnupg.org/documentation/manuals/gnupg-devel/Unattended-GPG-key-generation.html

brew install gpg pass

if [[ "$is_init" = true ]]; then
    rm ~/.gnupg -rf
fi

if [ -z "`ls ${HOME}/.gnupg/openpgp-revocs.d/`" ]; then
    if [[ "$is_init" = true ]]; then
        if [ -z "$CONFIG_USER_NAME" ]; then
            echo "CONFIG_USER_NAME is not set"
            echo "use export CONFIG_USER_NAME=your name"
            exit
        fi
        if [ -z "$CONFIG_USER_EMAIL" ]; then
            echo "CONFIG_USER_EMAIL is not set"
            echo "use export CONFIG_USER_EMAIL=your name"
            exit
        fi
    fi

    cp $(dirname $0)/data/gnupg /tmp/gnupg.data

    echo "Name-Real: ${CONFIG_USER_NAME}" >> /tmp/gnupg.data
    echo "Name-Email: ${CONFIG_USER_EMAIL}" >> /tmp/gnupg.data

    cat /tmp/gnupg.data

    gpg --batch --gen-key  /tmp/gnupg.data

    pass init ${CONFIG_USER_EMAIL}

    #gpg --export -a ${CONFIG_USER_EMAIL}

    #echo "register the key to github and gitlab"
fi
