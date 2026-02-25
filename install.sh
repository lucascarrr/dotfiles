#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Install stow if missing
if ! command -v stow &>/dev/null; then
  echo "Installing stow..."
  brew install stow
fi

cd "$DOTFILES"

for pkg in nvim tmux aerospace; do
  echo "Stowing $pkg..."
  stow --restow "$pkg"
done

echo "Done."
