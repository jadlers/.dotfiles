#!/bin/bash

~/.config/bitday-wallpaper/changebg;
setxkbmap us; # Default to US keyboard
setxkbmap -option caps:ctrl_modifier; # Make Caps Lock hold -> Ctrl modifier
xcape -e '#66=Escape';  # Caps Lock tap -> Esc
synclient TapButton1=0; # Disable trackpad tap
urxvtd -q -o -f &       # Start the urxvt daemon
