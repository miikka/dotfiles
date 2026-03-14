#!/usr/bin/env bash

set -euo pipefail

# When Goblin Mode installs the toolchain, it can end up creating a dummy
# `~/.zshrc`. We will remove it.
rm -f "$HOME/.zshrc"

mkdir -p "$HOME/bin"
stow -t "$HOME" core
stow -t "$HOME" goblinmode
