#!/bin/bash
set -xe

if [[ "$is_init" = true ]]; then
    sudo apt-get remove spotify
fi
if ! type spotify > /dev/null 2>&1; then
    curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update
    sudo apt-get install -y spotify-client
fi
