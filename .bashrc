#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#'Delete' key work in ST:
tput smkx

#Alias for manage dotfiles git repo
alias config='/usr/bin/git --git-dir=/home/infiltrator/.dotfiles/ --work-tree=/home/infiltrator'
