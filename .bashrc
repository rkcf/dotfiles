#Cows that say a fortune
cow=`ls /usr/share/cows/ | sort -R | tail -1 | cut -d '.' -f 1`
cowfacenumber=`shuf -i 1-6 -n 1`
cowfaceoptions="bdgpstwy"
cowface=${cowfaceoptions:cowfacenumber:1}
fortune -s | cowsay -$cowface -f $cow

# for tmux: export 256color
[ -n "$TMUX" ] && export TERM=rxvt-unicode-256color


#aliases
alias l="ls -a --color=always"
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
