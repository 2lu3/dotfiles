#!/bin/bash
set -xe


if [[ "$is_init" = true ]]; then
    sudo apt-get remove -y ripgrep
fi

if ! type rg > /dev/null 2>&1; then
    curl -L https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb -o /tmp/ripgrep.deb
    sudo dpkg -i /tmp/ripgrep.deb
fi
