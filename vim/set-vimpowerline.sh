#!/usr/bin/env zsh

pip3 install powerline-status

vimpwl=$(pip3 show powerline-status | grep 'Location' | sed 's/Location: //')
vimloc="/powerline/bindings/vim"
if [[ ! -f ~/.vimrc_local ]]; then 
    touch ~/.vimrc_local
fi

echo "set rtp+=${vimpwl}${vimloc}" > ~/.vimrc_local
