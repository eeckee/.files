#!/usr/bin/env sh

killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar eriksbar -c ~/.files/polybar.conf &
polybar eriksbar2 -c ~/.files/polybar_start_second_display.sh &
