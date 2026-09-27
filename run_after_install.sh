#!/bin/bash
set -euo pipefail

for name in zshenv zshrc; do
    file="$HOME/.${name}"
    source_line="[ -r \"\${HOME}/.${name}.global\" ] && source \"\${HOME}/.${name}.global\""

    touch "$file"
    sed -i.bak "s|\\.global\\.${name}|.${name}.global|g" "$file"
    grep -Fqx "$source_line" "$file" || sed -i.bak '$a\\'"$source_line" "$file"
    rm -f "$file.bak"
done
