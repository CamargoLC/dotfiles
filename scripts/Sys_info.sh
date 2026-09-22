#!/usr/bin/env bash
CPU=$(LC_ALL=C top -bn2 -d 0.5 | awk '/^%Cpu/ {print $2}' | tail -n 1)
MEM=$(LC_ALL=C free -h | awk '/^Mem:/ {print $3}')
notify-send -a "Sistema" " Info do Sistema" "CPU: $CPU%\nRAM: $MEM" -t 3000
