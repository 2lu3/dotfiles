#!/bin/bash
set -xe


if type git-credential-manager-core 2>&1; then
    if [[ "$is_init" = true ]]; then
        sudo apt-get remove -y gcmcore
    fi
fi

if ! type git-credential-manager-core 2>&1; then
    https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.785/gcm-linux_amd64.2.0.785.tar.gz -O /tmp/gcm.tar.gz
    mkdir -p /tmp/gcm
    tar -xvf /tmp/gcm.tar.gz -C /tmp/gcm --strip-components 1
    mv /tmp/gcm/git-credential-manager-core ${HOME}/.local/bin/
fi
