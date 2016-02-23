HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v
export PATH=$PATH:~/progs/shell
zstyle :compinstall filename '/home/fckr/.zshrc'

autoload -Uz compinit
compinit

autoload -U promptinit
promptinit

export PROMPT='%n@%m:%~%\ ↬ '
export EDITOR=vim
#aliases
alias l="ls -a --color=always"
alias ll=" l -lh"
alias x=sudo
alias z=clear
alias pac="x pacman -S"
alias u="x pacman -Syu"
alias ..="cd .."
alias s="x systemctl"
alias py=python
alias tz="tar xvfz"
alias v=vim
alias grep="grep --color=auto"
alias xv="sudo vim -u ~/.vimrc"
