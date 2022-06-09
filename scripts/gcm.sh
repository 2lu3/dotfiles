#!/bin/bash
set -xe

wget https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.696/gcmcore-linux_amd64.2.0.696.deb

sudo dpkg -i gcmcore-linux_amd64.2.0.696.deb
git-credential-manager-core configure
