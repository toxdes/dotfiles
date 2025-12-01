#!/bin/bash

status=$(playerctl status 2>/dev/null)
[ $? -ne 0 ] && exit 0

case "$status" in
  "Playing") icon="" ;;
  "Paused")  icon="" ;;
  *) exit 0 ;;
esac

artist=$(playerctl metadata artist)
title=$(playerctl metadata title)
player=$(playerctl -l | head -n1)

# Map player name to icon
case "$player" in
  *spotify*) app_icon="" ;;     # Spotify
  *firefox*|*zen-browser*) app_icon="" ;;     # Firefox or zen-browser
  *mpv*) app_icon="" ;;     # MPV
  *) app_icon="" ;;     # Default
esac

all_text="$artist - $title"
L=40
if [[ ${#all_text} > $L ]]; then
  text="${all_text::L}..."
else
  text="$all_text"
fi
escaped_text=$(echo $text | sed 's/&/&amp;/g')
echo "$app_icon $icon $escaped_text"
