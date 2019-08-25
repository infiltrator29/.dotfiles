#!/usr/bin/env bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

#run compton
run wpg -s current.png	 			# set color scheme
run setxkbmap -layout "pl" 			# keyboard layout
#run setxkbmap -model pc105 -layout "pl" 	# USB keyboard layout
