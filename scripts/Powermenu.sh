#!/usr/bin/env zsh

lock=""
logout="󰍃"
reboot="󰜉"
shutdown="⏻"

opcoes="$lock
$logout
$reboot
$shutdown"

chosen="$(echo "$opcoes" | dmenu -i -p "Sistema:")"

confirm_action() {
    local yes=""
    local no=""
    local choice="$(echo "$yes\n$no" | dmenu -i -p "Confirmar?")"
    [[ "$choice" == "$yes" ]] && return 0 || return 1
}

case $chosen in
    $shutdown) if confirm_action; then st -e sudo init 0; fi ;;
    $reboot)   if confirm_action; then st -e sudo reboot; fi ;;
    $lock)     slock ;;
    $logout)   if confirm_action; then killall dwm; fi ;;
esac
