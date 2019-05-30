# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

setxkbmap es
export PAGER="most"

LS_COLORS="*.jpg=33:*.png=33:*.mp4=35:*.avi=35:*.m4v=35:*.mkv=35:*.mpg=35:*.pdf=36:di=34:*.mp3=36:*.flac=36"
alias ls='ls --color=auto'

PS1="[\[\e[33m\]\u\[\e[m\]][\[\e[34m\]\H\[\e[m\]][\[\e[31m\]\A\[\e[m\]] \[\e[32;40m\]\w\[\e[m\] -> "

HISTSIZE=100000


# ALIAS PROPIOS

alias ll='ls -lh'
alias la='ls -ah'
alias xi='sudo xbps-install'
alias xy='sudo xbps-install -y'
alias xq='xbps-query -Rs'
alias xr='sudo xbps-remove'
alias xryo='sudo xbps-remove -yo'
alias xs='sudo xbps-install -S'
alias xu='sudo xbps-install -Suy'
alias xqf='sudo xbps-query -f'
alias mpv='mpv --audio-device=auto --hwdec=vdpau'
alias 3c='nano ~/.config/i3/config'
alias v3c='vim ~/.config/i3/config'
alias mkdir="mkdir -pv"
alias wget="wget -c"
alias histg="history | grep"
alias myip="curl http://ipecho.net/plain; echo"
alias h='history'
alias treesize='tree --sort=size'
alias bashrc='nano ~/.bashrc'
alias sstart='sudo sv start'
alias sstop='sudo sv stop'
alias sstatus='sudo sv status'
alias py="python3"
alias pyc="nano ~/.config/py3status/config"

mkcd () {
    mkdir -p $1
    cd $1
}

function alien {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

#OPCIONES

shopt -s autocd

## COLOR MANPAGES
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
