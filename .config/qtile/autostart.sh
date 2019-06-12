#!/bin/bash
exec nm-applet &

# Telegram
exec /opt/Telegram/Telegram &

# Pulseaudio
exec pulseaudio --start &

# Set keyboard Switching
exec setxkbmap us,th -option 'grp:lalt_lshift_toggle' &
