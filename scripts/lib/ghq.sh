#!/bin/bash
set -xe

if [[ "$is_init" = true ]]; then
    rm ~/.local/bin/ghq -f
fi

if ! type ghq > /dev/null 2>&1; then
    wget https://github.com/x-motemen/ghq/releases/download/v1.3.0/ghq_linux_amd64.zip -O /tmp/ghq.zip
    unzip -o /tmp/ghq.zip -d /tmp/
    mv /tmp/ghq_linux_amd64/ghq ~/.local/bin/
fi
