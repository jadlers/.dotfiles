#!/bin/sh

FORMAT="{{ title }} - {{ artist }}"
PLAYER="${1-playerctld}"
# Merge stdout & stderr
PLAYER_STATUS="$(playerctl --player="$PLAYER" status 2>&1)"

case "$PLAYER_STATUS" in
  Playing|Paused)
  # Playing)
    # NOTE: Old version, ratelimited by spotifyd
    # playerctl --player="$PLAYER" metadata --format "$FORMAT"

    # Works with spotifyd without exhausting requests
    spt playback --status 
    ;;
  Paused)
    echo "Paused" ;;
  *)
    echo "" ;;
esac
