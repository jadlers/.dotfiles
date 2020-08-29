#!/bin/sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar i3 >> /tmp/polybar1.log & disown
polybar i3-2 >> /tmp/polybar2.log & disown

echo "Polybar launched..."
