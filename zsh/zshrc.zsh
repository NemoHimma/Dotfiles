#!/usr/bin/env bash
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

echo "running zshrc"
##############################
#Setup brew packages ahead of system packages in $PATH.
#Below use absolute path to refer brew command
eval "$(/opt/homebrew/bin/brew shellenv)"
# So it's only applicable for macOS ARM M1 Pro for now.
##############################

# load zgenom
source ~/.zgenom/zgenom.zsh
export GPG_TTY=$TTY # https://unix.stackexchange.com/a/608921
export ZGEN_CUSTOM_COMPDUMP=$ZSH_COMPDUMP

# Check for plugin and zgenom updates every 7 days
zgenom autoupdate

# if the init script doesn't exist
if ! zgenom saved; then
    echo "Creating a zgenom save"
    #Load ohmyzsh
    zgenom ohmyzsh

    #plugins
    zgenom ohmyzsh plugins/git # provides many aliases and a few useful functions about git.
    zgenom ohmyzsh plugins/tmux # aliases to use tmux for convenience.
    zgenom ohmyzsh plugins/autojump # Using 'j' to quick navigate among directories and files.
    zgenom ohmyzsh plugins/docker # aliases about docker
    zgenom ohmyzsh plugins/command-not-found
    zgenom ohmyzsh plugins/fzf

    #plugins that not in ohmyzsh
    zgenom load zsh-users/zsh-autosuggestions
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load zsh-users/zsh-history-substring-search

    # Warn you when you run a command that you've got an alias for
    zgenom load djui/alias-tips
    
    # Completion-only repo
    zgenom load zsh-users/zsh-completions src
    
    #Theme
    zgenom load romkatv/powerlevel10k powerlevel10k

    #Generate init.sh
    zgenom save
fi

source ~/.p10k.zsh

# History Options
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt inc_append_history

# Share history across all your terminal windows
setopt share_history

# Increase history size
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Return time on long running processes
REPORTTIME=2
TIMEFMT="%U user %S system %P cpu %*Es total"

# Source local zshrc if exists
test -f ~/.zshrc.local && source ~/.zshrc.local

# Place to stash environment variables
#test -f ~/.secrets && source ~/.secrets

# Load functions
#for f in $DOTFILES/functions/*; do source $f; done

# Load aliases
test -f ~/.aliases && source ~/.aliases
#for f in $DOTFILES/aliases/*.aliases.*sh; do source $f; done

# Load all path files
#for f in $DOTFILES/path/*.path.sh; do source $f; done

###########################
### Configure fzf
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border --pointer='*' --bind 'ctrl-l:cancel''
export FZF_TMUX_HEIGHT=50%
###########################

###########################
### Configure autojump 
#[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
###########################

###########################
###  Configure command-not-found
HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
source "$HB_CNF_HANDLER";
fi
###########################

###########################
### Configure asdf
. $(brew --prefix asdf)/libexec/asdf.sh 
###########################

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# enable zsh completion for brew commands
#FPATH="$(brew --prefix)/share/zsh/site-functions:${FAPTH}"

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

