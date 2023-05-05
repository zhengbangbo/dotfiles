#!/usr/bin/env sh
# Bang-Bo's dotfiles install stow script

is_macos=0
is_linux=0
# Check OS type
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  is_linux=1
elif [[ "$OSTYPE" == "darwin"* ]]; then
  is_macos=1
else
  echo "OS not supported!"
  exit 1
fi

# Install stow
# Check if stow is not installed
if ! command -v stow >/dev/null 2>&1; then
  echo "[Dotfiles-Install] stow is not installed, ready to install stow!"
  if [[ $is_macos -eq 1 ]]; then
    brew install stow
  elif [[ $is_linux -eq 1 ]]; then
    sudo apt-get install stow
  fi
  echo "[Dotfiles-Install] stow is installed!"
fi

# Config stow
stow -vt ~ stow
