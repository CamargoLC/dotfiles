#!/usr/bin/env bash

# 1. Mata qualquer instância antiga ou travada da Polybar
killall -q polybar

# 2. Aguarda até que os processos sejam 100% encerrados
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 3. Dispara a nova barra usando a configuração atualizada
# (O nome "example" é exatamente o que definimos no bloco [bar/example] do seu arquivo)
polybar example 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar carregada com sucesso!"
