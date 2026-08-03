#!/bin/sh

# Injeção de design direto no comando para centralizar e esconder a barra de pesquisa
override='entry { enabled: false; } element-text { horizontal-align: 0.5; } listview { lines: 3; }'

escolha=$(printf "Desligar\nReiniciar\nSair" | rofi -dmenu -i -p "Energia" -theme-str "$override")

# Executa o comando baseado na seleção
case "$escolha" in
    "Desligar") alacritty -e sudo init 0 ;;
    "Reiniciar") alacritty -e sudo reboot ;;
    "Sair") bspc quit ;;
esac
