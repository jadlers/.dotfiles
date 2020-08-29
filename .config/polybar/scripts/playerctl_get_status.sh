#!/bin/sh

FORMAT="{{ title }} - {{ artist }}"
PLAYER="${1-playerctld}"

if [ "$(playerctl --player="$PLAYER" status)" = "Playing"  ]; then
    playerctl --player="$PLAYER" metadata --format "$FORMAT"
elif [ "$(playerctl --player="$PLAYER" status)" = "Paused"  ]; then
    playerctl --player="$PLAYER" metadata --format "$FORMAT"
else # Can be configured to output differently when player is paused
    echo "No music is playing"
fi
