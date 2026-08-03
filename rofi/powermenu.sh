#!/bin/sh

# Injeções de design tático para os painéis
override_main='entry { enabled: false; } element-text { horizontal-align: 0.0; } listview { lines: 4; }'
override_conf='entry { enabled: false; } element-text { horizontal-align: 0.0; } listview { lines: 2; }'

# Função de interceptação (Gatilho de Confirmação)
confirmar() {
    # O $1 é o nome da ação que aparece no título do Rofi (ex: "Desligar?")
    resposta=$(printf "Sim\nNão" | rofi -dmenu -i -p "$1?" -theme-str "$override_conf")
    
    if [ "$resposta" = "Sim" ]; then
        # Se confirmado, executa o comando guardado no $2
        eval "$2"
    fi
}

# 1. Painel Principal
escolha=$(printf "Bloquear\nDesligar\nReiniciar\nSair" | rofi -dmenu -i -p "Energia" -theme-str "$override_main")

# 2. Direcionamento lógico
case "$escolha" in
    "Bloquear") 
        slock 
        ;;
    "Desligar") 
        confirmar "Desligar" "alacritty -e sudo init 0" 
        ;;
    "Reiniciar") 
        confirmar "Reiniciar" "alacritty -e sudo reboot" 
        ;;
    "Sair") 
        confirmar "Sair" "bspc quit" 
        ;;
esac
