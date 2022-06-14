#!/bin/bash
set -xe

# https://gist.github.com/woods/8970150
# https://www.gnupg.org/documentation/manuals/gnupg-devel/Unattended-GPG-key-generation.html

if [[ "$is_init" = true ]]; then
    rm ~/.gnupg -rf
fi

if [ -z "`ls ${HOME}/.gnupg/openpgp-revocs.d/`" ]; then
    cp $(dirname $0)/data/gnupg /tmp/gnupg.data

    echo "Name-Real: ${CONFIG_USER_NAME}" >> /tmp/gnupg.data
    echo "Name-Email: ${CONFIG_USER_EMAIL}" >> /tmp/gnupg.data

    cat /tmp/gnupg.data

    gpg --batch --gen-key  /tmp/gnupg.data

    pass init ${CONFIG_USER_NAME}
fi
