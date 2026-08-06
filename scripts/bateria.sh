#!/usr/bin/env bash
CHARGE=$(cat /sys/class/power_supply/BAT1/capacity)
STATUS=$(cat /sys/class/power_supply/BAT1/status)

if [ "$STATUS" = "Charging" ]; then
    ICON=" Carregando"
else
    ICON=" Bateria"
fi

notify-send -a "Energia" -h int:value:"$CHARGE" "$ICON" "Carga atual: $CHARGE%" -t 3000
