#!/bin/bash
nm-applet &

# Pulseaudio
pulseaudio --start &

# Set keyboard Switching
setxkbmap us,th -option 'grp:lalt_lshift_toggle' &

# Set background
feh --bg-scale ~/Pictures/cat-meme-bg.jpg &
