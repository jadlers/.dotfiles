#!/bin/sh

STATUS=$(mullvad status)

if [ "$STATUS" = "Disconnected" ]; then
    echo "%{F#f00}%{A1:nordvpn c:}no vpn%{A}%{F-}"
else
    echo "%{F#82E0AA}%{A1:mullvad d:}$(mullvad status | cut -d ' ' -f5-)%{A}%{F-}"
fi
