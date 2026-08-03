#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-2"
theme='style-8'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown=''
reboot=''
lock=''
suspend=''
logout=''
yes=''
no=''

# Rofi CMD
rofi_cmd() {
        rofi -dmenu \
                -p "Uptime: $uptime" \
                -mesg "Uptime: $uptime" \
                -theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
        rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
                -theme-str 'mainbox {children: [ "message", "listview" ];}' \
                -theme-str 'listview {columns: 2; lines: 1;}' \
                -theme-str 'element-text {horizontal-align: 0.5;}' \
                -theme-str 'textbox {horizontal-align: 0.5;}' \
                -dmenu \
                -p 'Confirmation' \
                -mesg 'Are you Sure?' \
                -theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
        echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
        echo -e "$lock\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
    if [[ $1 == '--shutdown' ]]; then
        alacritty -e sudo init 0
    elif [[ $1 == '--reboot' ]]; then
        alacritty -e sudo reboot
    elif [[ $1 == '--logout' ]]; then
        bspc quit
    fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
                run_cmd --shutdown
        ;;
    $reboot)
                run_cmd --reboot
        ;;
    $lock)
                # Força bruta: aciona o i3lock diretamente sem checar caminhos absolutos.
                # A flag -c 000000 garante uma tela de bloqueio preta limpa.
                i3lock -c 000000
        ;;
    $suspend)
                run_cmd --suspend
        ;;
    $logout)
                run_cmd --logout
        ;;
esac
