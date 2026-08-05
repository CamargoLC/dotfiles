#!/usr/bin/env bash

lock=""
logout=""
reboot=""
shutdown=""

options="$lock\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | rofi -dmenu -i -theme /mnt/meu_hd/dotfiles/rofi/powermenu.rasi)"

confirm_action() {
    local yes=""
    local no=""
    
    local choice="$(echo -e "$yes\n$no" | rofi -dmenu -i -theme /mnt/meu_hd/dotfiles/rofi/powermenu.rasi)"
    
    if [[ "$choice" == "$yes" ]]; then
        return 0
    else
        return 1
    fi
}

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
