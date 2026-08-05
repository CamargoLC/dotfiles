#!/usr/bin/env bash

# Ícones Táticos
lock=""
logout=""
reboot=""
shutdown=""

# Opções do menu lateral principal
options="$lock\n$logout\n$reboot\n$shutdown"

# Chamada do Rofi principal
chosen="$(echo -e "$options" | rofi -dmenu -i -theme /mnt/meu_hd/dotfiles/rofi/powermenu.rasi)"

# A Barreira de Segurança Coesa
confirm_action() {
    local yes=""
    local no=""
    
    # Chama o Rofi usando a MESMA matriz lateral para manter o visual 100% idêntico
    local choice="$(echo -e "$yes\n$no" | rofi -dmenu -i -theme /mnt/meu_hd/dotfiles/rofi/powermenu.rasi)"
    
    if [[ "$choice" == "$yes" ]]; then
        return 0
    else
        return 1
    fi
}

# Execução Lógica 
case $chosen in
    $shutdown)
        if confirm_action; then
            alacritty -e sudo init 0
        fi
        ;;
    $reboot)
        if confirm_action; then
            alacritty -e sudo reboot
        fi
        ;;
    $lock)
        slock
        ;;
    $logout)
        if confirm_action; then
            bspc quit
        fi
        ;;
esac
