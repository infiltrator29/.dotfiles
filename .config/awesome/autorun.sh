#!/usr/bin/env bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

#run wpg -s current.png	 			# set color scheme
run compton
run setxkbmap -layout "pl" 			# keyboard layout
