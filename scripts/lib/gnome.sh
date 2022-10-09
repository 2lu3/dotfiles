#!/bin/bash
set -xe

pushd $(dirname $0)
dconf load / < ../data/gnome
popd

