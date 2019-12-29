[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

numlockx &
setxkbmap -option caps:swapescape &

# set color scheme
wpg -s spatialnihilism.jpg &

exec awesome
