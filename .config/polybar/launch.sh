#!/bin/bash

# Terminate already running bar instance
killall -q polybar

# Wait until process have been shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch sweetybar
polybar sweetybar &

echo "Sweetybar launched..."
