#!/bin/bash

# see man zscroll for documentation of the following parameters
zscroll -l 60 \
        --delay 0.1 \
        --match-command "playerctl --player=spotify status" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true '/home/jacob/.config/polybar/scripts/spotify_get_status.sh spotify' &

wait
