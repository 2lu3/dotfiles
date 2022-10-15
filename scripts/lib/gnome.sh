#!/bin/bash
set -xe

# https://askubuntu.com/questions/984205/how-to-save-gnome-settings-in-a-file

mkdir -p ~/.backup/gnome
dconf dump / > ~/.backup/gnome/$(date +%Y%m%d-%H%M%S)

pushd $(dirname $0)
dconf load / < ../data/gnome
popd

