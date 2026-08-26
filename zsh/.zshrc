# ~/.bashrc

# Se não for uma sessão interativa, aborte
[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

export TERMINAL="st"
export COLORTERM="truecolor"
export EDITOR="nvim"

# Comandos Básicos
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias bashrc='nvim ~/.bashrc'
alias zshrc='nvim ~/.zshrc'

# Aplicativos
alias ra='ranger'
alias vim='nvim'
alias vi='nvim'
alias ff='fastfetch'
alias ma='cmatrix'
alias ttc='tty-clock -b -c -C 2 -B'
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
alias xro='sudo xbps-remove -Oo' # Remove pacotes órfãos limpando o cache

# Sistema
alias off='sudo init 0'
alias reb='sudo reboot'

# Iniciar com o terminal
fastfetch
eval "$(oh-my-posh init zsh --config /mnt/meu_hd/dotfiles/oh-my-posh/nord-minimal.omp.json)"

# Plugins do Zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Cursor
echo -ne '\e[6 q'

precmd() {
    echo -ne '\e[6 q'
}
