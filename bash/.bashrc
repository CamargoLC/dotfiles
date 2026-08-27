# ~/.bashrc

# Se não for uma sessão interativa, aborte
[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

export TERMINAL="st"
export COLORTERM="truecolor"
export EDITOR="nvim"

# Comandos Básicos
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias bashrc='nvim ~/.bashrc'

# Aplicativos
alias ra='ranger'
alias vim='nvim'
alias vi='nvim'
alias ff='fastfetch'
alias ma='cmatrix -b -C cyan'
alias ttc='tty-clock -b -c -C 4'
alias bt='btop'

# Conteiner (Gerenciamento Flatpak)
alias fu='sudo flatpak update'
alias fuu='flatpak update --user'
export BROWSER="flatpak run io.gitlab.librewolf-community"

# Void Linux (Gerenciamento XBPS)
alias xq='sudo xbps-query -Rs'
alias xu='sudo xbps-install -Su'
alias xl='sudo xbps-install -S'
alias xr='sudo xbps-remove -R'
alias xro='sudo xbps-remove -Oo'

# Sistema
alias off='sudo init 0'
alias reb='sudo reboot'

# Iniciar com o terminal
fastfetch
eval "$(oh-my-posh init bash --config /mnt/meu_hd/dotfiles/oh-my-posh/nord-minimal.omp.json)"
