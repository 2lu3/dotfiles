#!/bin/bash
set -xe

if ! type git-credential-manager-core 2>&1; then
    wget https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.696/gcmcore-linux_amd64.2.0.696.deb -O /tmp/gcm.deb
    sudo dpkg -i /tmp/gcm.deb
    # git-credential-manager-core configure
fi
