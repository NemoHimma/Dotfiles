# setup /opt/homebrew on macOS ARM
eval "$(/opt/homebrew/bin/brew shellenv)"

# use vim that support python3
export EDITOR=/opt/homebrew/bin/vim
# make scripts usable by adding environment variable.
export PATH=~/bin:$PATH
# make fzf usable as vim-plugin. fzf is installed `brew install fzf` in setup-homebrew.sh script.
set rtp+=/opt/homebrew/opt/fzf
