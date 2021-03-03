#!/bin/sh

ENTRIES="Lock
Logout
Suspend
Shutdown
Reboot
Windows"

LINES=$(echo "$ENTRIES" | wc -l)

# Wayland
wayland () {
  SELECTED=$(echo "$ENTRIES" \
    | wofi --dmenu --insensitive --lines="$LINES" --prompt="Select action" \
    | awk '{print tolower($1)}')

  case "$SELECTED" in
    lock)
      exec swaylock-blur;;
    logout)
      playerctl --all-players pause;
      swaymsg exit;;
    shutdown)
      playerctl --all-players pause;
      exec systemctl poweroff;;
    suspend)
      playerctl --all-players pause;
      exec systemctl suspend;;
    reboot)
      playerctl --all-players pause;
      exec systemctl reboot;;
    windows)
      playerctl --all-players pause;
      exec systemctl reboot --boot-loader-entry=auto-windows;;
    *)
      exit 1;;
  esac
}

# X11
x11 () {
  SELECTED=$(echo "$ENTRIES" \
    | dmenu -i -sb "#dc3545" -p "Select action:" \
    | awk '{print tolower($1)}')

  case "$SELECTED" in
    lock)
      exec i3lock --ignore-empty-password --show-failed-attempts --color=a6dcef;;
    logout)
      playerctl --all-players pause;
      exec i3-msg exit;;
    shutdown)
      playerctl --all-players pause;
      exec systemctl poweroff;;
    suspend)
      playerctl --all-players pause;
      exec systemctl suspend;;
    reboot)
      playerctl --all-players pause;
      exec systemctl reboot;;
    windows)
      playerctl --all-players pause;
      exec systemctl reboot --boot-loader-entry=auto-windows;;
    *)
      exit 1;;
  esac
}

x11;
