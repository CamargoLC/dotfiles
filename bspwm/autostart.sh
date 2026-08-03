#!/bin/sh

# Restaura o cursor padrão do sistema (aniquila o bug do cursor em formato de "X")
xsetroot -cursor_name left_ptr &

# Restaura o wallpaper definido anteriormente
~/.fehbg &

# Inicia o compositor de efeitos visuais para garantir as transparências
picom --backend glx -b &

# Dispara o script original da sua Polybar
~/.config/polybar/launch.sh &

# Applets da Bandeja do Sistema (Tray)
nm-applet &

# Teclado ABNT 2
setxkbmap br &
