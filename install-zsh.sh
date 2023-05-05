#!/usr/bin/env sh
# Bang-Bo's dotfiles install zsh script

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

# Install zsh
# Check if zsh is not installed
if ! command -v zsh >/dev/null 2>&1; then
  echo "[Dotfiles-Install] zsh is not installed, ready to install zsh!"
  if [[ $is_macos -eq 1 ]]; then
    brew install zsh
  elif [[ $is_linux -eq 1 ]]; then
    sudo apt-get install zsh
  fi
  echo "[Dotfiles-Install] zsh is installed!"
fi

# Install ohmyzsh
# Check if ohmyzsh is not installed
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "[Dotfiles-Install] ohmyzsh is not installed, ready to install ohmyzsh!"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "[Dotfiles-Install] ohmyzsh is installed!"
fi

# Install powerlevel10k, zsh-autosuggestions, zsh-syntax-highlighting, zsh-z
if [[ -n $(echo ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}) ]]; then
  echo "[Dotfiles-Install] Ready to download some zsh plugins to ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}!"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  echo "[Dotfiles-Install] Downloaded powerlevel10k!"
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  echo "[Dotfiles-Install] Downloaded zsh-autosuggestions!"
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  echo "[Dotfiles-Install] Downloaded zsh-syntax-highlighting!"
  git clone --depth=1 https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
  echo "[Dotfiles-Install] Downloaded zsh-z!"
  exit 0
else
  echo "[Dotfiles-Install] ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom} is not a directory!"
  exit 1
fi

# Config zsh
stow zsh
