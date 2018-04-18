#!/bin/bash
scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
convert /tmp/screen.png -paint 3 -modulate 80 /tmp/screen.png
convert /tmp/screen.png -paint 3 /tmp/screen.png
[[ -f ~/.config/i3/lock.png ]] && convert /tmp/screen.png  ~/.config/i2/lock.png -gravity center -composite -matte /tmp/screen.png
playerctl play-pause
i3lock -u -e -i /tmp/screen.png
# betterlockscreen --lock
