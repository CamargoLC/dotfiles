#!/usr/bin/env zsh

# Diretório do seu HD
DIR="/mnt/meu_hd/Screenshots"
mkdir -p "$DIR"

ARQUIVO="$DIR/%Y-%m-%d_%H-%M-%S_scrot.png"

capturar_tela() {
    sleep 0.2
    scrot "$ARQUIVO" -e 'xclip -selection clipboard -target image/png -i $f && notify-send "Print" "Tela inteira salva e copiada!"'
}

capturar_area() {
    scrot -s "$ARQUIVO" -e 'xclip -selection clipboard -target image/png -i $f && notify-send "Print" "Área selecionada salva e copiada!"'
}

if [[ "$1" == "tela" ]]; then
    capturar_tela
elif [[ "$1" == "area" ]]; then
    capturar_area
else
    opcoes="  Tela Inteira\n  Selecionar Area"
    escolha="$(printf "%b\n" "$opcoes" | dmenu -i -p "Print:")"

    case "$escolha" in
        "  Tela Inteira") capturar_tela ;;
        "  Selecionar Area") capturar_area ;;
    esac
fi
