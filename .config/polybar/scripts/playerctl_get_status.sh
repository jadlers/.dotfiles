#!/bin/sh

FORMAT="{{ title }} - {{ artist }}"
PLAYER="${1-playerctld}"
# Merge stdout & stderr
PLAYER_STATUS="$(playerctl --player="$PLAYER" status 2>&1)"
info="$(playerctl --player="$PLAYER" metadata --format "$FORMAT")"

case "$PLAYER_STATUS" in
  Playing)
    echo "$info" ;;
  Paused)
    echo "(Paused) $info" ;;
  *)
    echo "" ;;
esac
