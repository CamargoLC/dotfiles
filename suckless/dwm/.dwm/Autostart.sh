#!/bin/sh

xsetroot -cursor_name left_ptr &
picom --backend glx -b &
nm-applet &
setxkbmap br &
pulseaudio --start &
nitrogen --restore &
dwmblocks &
xset r rate 600 50 &
xset s off &
xset -dpms &
