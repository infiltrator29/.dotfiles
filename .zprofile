#
# ~/.zsh_profile
#

#This file runs on logins
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.local/bin/custom:$HOME/.emacs.d/bin:$PATH


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export EDITOR="vim"
export TERMINAL="st"

