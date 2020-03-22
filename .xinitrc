[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

numlockx &
setxkbmap -option caps:swapescape &
setxkbmap -layout "pl" &

exec awesome
