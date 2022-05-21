#!/bin/bash
set -xe

rm /var/discord.deb -f
wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt-get install -y discord

