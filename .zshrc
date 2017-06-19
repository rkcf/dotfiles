#zsh configuration options
#history settings
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_space

#completion settings 
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list '' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select

zstyle ':completion:*:descriptions' format '%U%B%d%b%u' 
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

setopt extendedglob
setopt correctall

bindkey -v
export EDITOR=vim
export PROMPT='%F{254}[%F{cyan}%n@%m%F{red} %~%F{254}]%\$ '
autoload -U promptinit
promptinit

for file in  ~/.config/shell/*; do
	source "$file"
done

#aliases
alias l="ls -a --color=always"
alias ll=" l -lh"
alias x=sudo
alias z=clear
alias mkdir='mkdir -pv'
alias wget='wget -c'
alias ..="cd .."
alias s="x systemctl"
alias sstat="x systemctl status"
alias py=python
alias tz="tar xvfz"
alias v=vim
alias grep="grep --color=auto"
alias xv="sudo vim -u ~/.vimrc"
alias ports="netstat -tulanp"
