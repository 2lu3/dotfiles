#!/bin/bash
set -euo pipefail

source_directory="$HOME/.agents"

for target in codex claude; do
    target_directory="$HOME/.$target"
    mkdir -p "$target_directory/rules" "$target_directory/skills"
    cp -R "$source_directory/rules/." "$target_directory/rules/"
    cp -R "$source_directory/skills/." "$target_directory/skills/"
done
