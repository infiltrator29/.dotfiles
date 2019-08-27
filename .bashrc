#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

alias ls='ls --color=auto'

#bash prompt colors:
PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '

#'Delete' key work in ST:
tput smkx

#Alias for manage dotfiles git repo
alias config='/usr/bin/git --git-dir=/home/infiltrator/.dotfiles/ --work-tree=/home/infiltrator'

