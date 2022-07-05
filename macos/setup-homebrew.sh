#!/usr/bin/env bash
# bash know brew command but zsh doesn't
# Install homebrew and essential packages

if ! type brew > /dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_UPGRADE=1

PACKAGES=(
  "asdf"    
  "fzf"
  "git"     # use this git by prceeding brew dir in $PATH
  "exa"
  "tree"
  "fd"
  "jq"
  "ripgrep"
  "zsh"      #
  "tmux"      
  "vim"      # environment variable is set in .zshenv file
  "autojump" # used by oh-my-zsh plugin
)

echo "Checking Homebrew packages..."

brew_list=$(brew list --formulae -1)

for PKG in "${PACKAGES[@]}"
do
  if ! echo "$brew_list" | grep -q "$PKG"; then
    echo "Installing $PKG..."
    brew install $PKG
  fi
done

echo "All packages installed."
