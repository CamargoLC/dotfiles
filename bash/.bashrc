# ~/.bashrc

# Se não for uma sessão interativa, aborte
[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

export TERMINAL="alacritty"
export EDITOR="nvim"

# Comandos Básicos
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias lla='ls -la'

# Aplicativos
alias ra='ranger'
alias vim='nvim'
alias ff='fastfetch'
alias ma='cmatrix -b -C cyan'
alias ttc='tty-clock -b -c -C 4'
alias bt='btop'
alias ht='htop'

# Conteiner (Gerenciamento Flatpak)
alias fu='sudo flatpak update'
alias fuu='flatpak update --user'

# Void Linux (Gerenciamento XBPS)
alias xq='sudo xbps-query -Rs'
alias xu='sudo xbps-install -Su'
alias xi='sudo xbps-install -S'
alias xr='sudo xbps-remove -R'
alias xro='sudo xbps-remove -Oo' # Remove pacotes órfãos limpando o cache

# Sistema
alias off='sudo init 0'
alias reb='sudo reboot'

# Iniciar com o terminal
eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/meu-tema.json)"
fastfetch
