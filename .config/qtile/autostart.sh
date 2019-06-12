#!/bin/bash
exec nm-applet &

# Pulseaudio
exec pulseaudio --start &

# Set keyboard Switching
exec setxkbmap us,th -option 'grp:lalt_lshift_toggle' &
