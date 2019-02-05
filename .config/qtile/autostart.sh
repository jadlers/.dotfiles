#!/bin/bash

~/.fehbg;
setxkbmap -option caps:ctrl_modifier; # Make caps lock be a ctrl modifier
xcape -e '#66=Escape';
setxkbmap us;
urxvtd -q -o -f &
