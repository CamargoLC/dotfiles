#!/usr/bin/env bash
pamixer -i 5
VOL=$(pamixer --get-volume)
notify-send -a "Áudio" -h int:value:"$VOL" " Volume" "Nível: $VOL%" -t 1500
