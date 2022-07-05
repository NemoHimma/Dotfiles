#!/usr/bin/env bash
# The variable that defined in this file won't be loaded when you enter interactive shell.
echo "running zprofile"
export PATH=~/bin:$PATH
test -f ~/.bash_profile && source ~/.bash_profile
