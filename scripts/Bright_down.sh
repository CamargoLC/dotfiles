#!/usr/bin/env bash

brightnessctl set 5%- > /dev/null

CURRENT=$(brightnessctl get)
MAX=$(brightnessctl max)
PERCENT=$(( (CURRENT * 100 + MAX / 2) / MAX ))

ICON=$'\uf185'   # nf-fa-sun_o

notify-send -a "Brilho" -h int:value:"$PERCENT" "$ICON  Brilho" "Nível: $PERCENT%" -t 1500
