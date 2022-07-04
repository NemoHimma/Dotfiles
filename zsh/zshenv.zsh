# setup /opt/homebrew on macOS ARM
eval "$(/opt/homebrew/bin/brew shellenv)"

# use vim that support python3
export EDITOR=/opt/homebrew/bin/vim
export PATH=~/bin:$PATH
set rtp+=/opt/homebrew/opt/fzf
