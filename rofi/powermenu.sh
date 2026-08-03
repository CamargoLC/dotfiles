#!/bin/sh

# Injeção de design: ocultando a busca e forçando o texto totalmente para a esquerda (0.0)
override='entry { enabled: false; } element-text { horizontal-align: 0.0; } listview { lines: 3; }'

escolha=$(printf "Desligar\nReiniciar\nSair" | rofi -dmenu -i -p "Energia" -theme-str "$override")

# Executa o comando baseado na seleção
case "$escolha" in
    "Desligar") alacritty -e sudo init 0 ;;
    "Reiniciar") alacritty -e sudo reboot ;;
    "Sair") bspc quit ;;
esac
