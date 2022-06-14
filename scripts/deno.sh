#!/bin/bash
set -xe

if [[ "$is_init" = true ]]; then
    rm ~/.local/bin/deno -f
fi

if ! type deno > /dev/null 2>&1; then
    export DENO_INSTALL=~/.local/
    curl -fsSL https://deno.land/install.sh | sh
fi
