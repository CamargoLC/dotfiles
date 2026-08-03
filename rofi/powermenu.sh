#!/bin/sh

# Gera as opções e captura a escolha usando a interface do Rofi
escolha=$(printf "Desligar\nReiniciar\nSair" | rofi -dmenu -i -p "Energia")

# Executa o comando baseado na seleção
case "$escolha" in
    "Desligar") alacritty -e sudo init 0 ;;
    "Reiniciar") alacritty -e sudo reboot ;;
    "Sair") bspc quit ;;
esac
