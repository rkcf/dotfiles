#zsh configuration options

#history settings
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_space
setopt hist_expire_dups_first
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt interactivecomments

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

#completion settings
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' matcher-list '' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

setopt extendedglob
#setopt correctall

# dir navigation
DIRSTACKSIZE=20
DIRSTACKFILE=~/.zdirs

setopt autocd autopushd pushdignoredups
autoload -Uz chpwd_recent_dirs cdr zdd-zsh-hook

# Fancy cd that can cd into parent directory, if trying to cd into file.
cd() {
	if (( $+2 )); then
		builtin cd "$@"
		return 0
	fi

	if [ -f "$1" ]; then
		echo "${yellow}cd ${1:h}${NC}" >&2
		builtin cd "${1:h}"
	else
		builtin cd "${@}"
	fi
}

# use vim mode
bindkey -v

# various exports
export PAGER=less
export EDITOR=vim
export GOPATH=/home/fckr/progs/go
export PATH=$PATH:~/progs/shell

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# prompt
export PROMPT='%F{254}[%F{cyan}%n@%m%F{red} %~%F{254}]%\$ '
autoload -U promptinit
promptinit

#aliases
alias d="dirs -v | head -n 5"
alias l="ls -a --color=always"
alias ll=" l -lh"
alias ls="ls --color=always --group-directories-first"
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
alias myip="lynx --dump http://ipecho.net/plain"
alias ssh="TERM=xterm-256color ssh"
alias pac="sudo pacman -S"
alias pacr="sudo pacman -Rs"
alias u="sudo pacman -Syu"
alias ccm="sudo ccm"
alias emacs="TERM=xterm-256color emacs -nw"
alias dmenu='dmenu -sb "#FFB86C" -sf "#282A36" -nf "#F8F8F2" -nb "#282A36" -fn "Hack-14"'
alias space='du * -sh | sort -h'
