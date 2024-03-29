#!/bin/bash
set -xe


if type git-credential-manager-core 2>&1; then
    if [[ "$is_init" = true ]]; then
        rm ${HOME}/.local/bin/git-credential-manager-core
    fi
fi

if ! type git-credential-manager-core 2>&1; then
    wget https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.785/gcm-linux_amd64.2.0.785.tar.gz -O /tmp/gcm.tar.gz
    mkdir -p /tmp/gcm
    tar -xvf /tmp/gcm.tar.gz -C /tmp/gcm/ 
    mv /tmp/gcm/git-credential-manager-core ${HOME}/.local/bin/

    git-credential-manager-core configure
fi
