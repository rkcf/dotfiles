HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v

zstyle :compinstall filename '/home/fckr/.zshrc'

autoload -Uz compinit
compinit

autoload -U promptinit
promptinit

export PROMPT='[%n@%m %~]%\$ '

#aliases
alias l="ls -a --color=always"
alias ll=" l -lh"
alias x=sudo
alias z=clear
alias u="x pacman -Syu"
alias ..="cd .."
alias sstat="x systemctl"
alias sres="x systemctl restart"
alias skill="x systemctl stop"
alias py=python
alias tz="tar xvfz"
alias nh="x nethogs enp2s0"
alias v=vim
alias sp="spim -f"
alias grep="grep --color=auto"
alias xv="sudo vim -u ~/.vimrc"
