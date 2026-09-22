#!/usr/bin/env bash

pamixer -u
pamixer -d 5

VOL=$(pamixer --get-volume)
ICON=$'\uf027'

notify-send -a "Áudio" -h int:value:"$VOL" "$ICON  Volume" "Nível: $VOL%" -t 1500
