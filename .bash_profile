#
# ~/.bash_profile
#

#This file runs on logins

export PATH="$PATH:$HOME/.scripts"
export EDITOR="vim"
export TERMINAL="st"


[[ -f ~/.bashrc ]] && . ~/.bashrc

# [probably] set numlock enable - also can set in .xinitrc ('numlockx&')
#setleds -D +num
