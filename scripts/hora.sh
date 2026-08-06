#!/usr/bin/env bash
DATA=$(date '+%A, %d de %B de %Y')
HORA=$(date '+%H:%M')
notify-send -a "Calendário" " Data e Hora" "$DATA\n $HORA" -t 3000
