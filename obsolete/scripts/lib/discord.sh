#!/bin/bash
set -xe

if ! type discord > /dev/null 2>&1; then
    rm /var/discord.deb -f
    wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
    sudo apt-get install -y /tmp/discord.deb
fi

