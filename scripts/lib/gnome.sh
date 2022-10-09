#!/bin/bash
set -xe

# https://askubuntu.com/questions/984205/how-to-save-gnome-settings-in-a-file

pushd $(dirname $0)
dconf load / < ../data/gnome
popd

