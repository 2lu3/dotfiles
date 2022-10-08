#!/bin/bash
set -xe

if [[ "$is_init" = true ]]; then
    sudo apt-get remove google-chrome-browser
fi

if ! type google-chrome-stable > /dev/null 2>&1; then
    rm /tmp/chrome-stable.deb -f
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/chrome-stable.deb
    sudo apt-get install -y /tmp/chrome-stable.deb
fi

