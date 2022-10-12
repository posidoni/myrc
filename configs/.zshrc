#!/bin/bash

# note for self (chrome dir):
# /Users/posidoni/Library/Application Support/Google/Chrome

export GOPATH="$HOME/.local/go"
export ZSH_DISABLE_COMPFIX=true
export TERM=xterm-256color
# export ZSH_THEME="af-magic"
export ZSH_THEME=""
# export ZSH_THEME="spaceship"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export NEOVIDE_MULTIGRID=1

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

export EDITOR="nvim"
export VISUAL="neovide"
bindkey -v

# ZSH config
export plugins=(
    git
    docker
)

# @Warning: plugins must be exported before oh-my-zsh is sources source $ZSH/oh-my-zsh.sh
source "$HOME"/.oh-my-zsh/oh-my-zsh.sh # it is okay to get warning here, as bashls can't correctly parse ZSH scripts
export ZSH="$HOME/.oh-my-zsh"

# Aliases
alias lg="lazygit"
alias tks="tmux kill-session -t"
alias vimdiff="nvim -d"
alias vim="nvim"
alias vi="nvim"
alias neovide="$BREW_BIN/neovide --multigrid --"
alias vimz="/usr/bin/vi"
alias tmux="tmux -2"

alias getllvm="clang++ -emit-llvm -S"
alias getasm="clang++ -S -fverbose-asm"
alias getdisasm="objdump -S --disassemble"

alias get_llvm="getllvm"
alias get_asm="getasm"
alias get_disasm="getdisasm"

# LS Aliases
alias ll="exa -l -g --icons"
alias la="ll -a"
alias ls="exa --icons -F --sort=size"
alias tree="ls -T"
alias t="tree -a -L 1"
alias l="la"

# Better mkdir
alias mkdir="mkdir -p"

# CLI file manager alias
alias rr="ranger"
alias rrr="ranger"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "
alias caps="setxkbmap -option caps:swapescape"

# WSL things
alias ~~='cd /mnt/c/Users/kuzne/Desktop'

### Function extract for common file formats ###
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
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

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# @W Programs that DO NOT support XDG_BASE_DIR
export LESSHISTFILE="-"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
eval "$(starship init zsh)"
