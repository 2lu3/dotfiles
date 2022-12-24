#!/bin/bash
set -xe

curl -fsSL https://get.jetpack.io/devbox -o /tmp/devbox.sh

sudo bash /tmp/devbox.sh -f
