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
  "asdf"    # dotbot use asdf to install python 3.7.12  
  "fzf"     
  "git"     # use this git by prceeding brew dir in $PATH
  "exa"     # modern enhancement of `ls`
  "tree"
  "fd"      # enhanced version of `find`
  "jq"
  "ripgrep" # enhanced version of `grep` short for `rg`
  "zsh"      
  "tmux"      
  "vim"     
  "autojump" # used as oh-my-zsh plugin short for `j`
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
