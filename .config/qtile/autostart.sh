#!/bin/bash

~/.config/bitday-wallpaper/changebg;
setxkbmap us;
setxkbmap -option caps:ctrl_modifier; # Make caps lock be a ctrl modifier
xcape -e '#66=Escape';
synclient TapButton1=0;
urxvtd -q -o -f &
