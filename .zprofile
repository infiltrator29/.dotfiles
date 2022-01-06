#
# ~/.zsh_profile
#

#This file runs on logins
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.local/bin/custom:$HOME/.emacs.d/bin:$PATH


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export EDITOR="vim"
export TERMINAL="st"


# PinePhone specific configuration {{{
if grep -q pinewolf /etc/hostname; then

    syncthing -no-browser > /dev/null &
fi
# }}}
