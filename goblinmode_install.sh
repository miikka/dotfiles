#!/usr/bin/env bash

set -euo pipefail

mkdir -p "$HOME/bin"
stow -t "$HOME" core
stow -t "$HOME" goblinmode
