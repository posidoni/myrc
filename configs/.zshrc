#!/bin/bash
# File: ZSH Config
# Author: Mikhail Kuznetsov https://github.com/MikhailKuzntsov1
# upd: 05 July 2022
# 123
export ZSH_DISABLE_COMPFIX=true
## ENV Configuration
export TERM=xterm-256color
# export ZSH_THEME="af-magic"
export ZSH_THEME=""
# export ZSH_THEME="spaceship"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export HOMEBREW_NO_AUTO_UPDATE=1
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi
main_editor="Vim"

if [[ "$main_editor" == "Vim" ]]; then
    export EDITOR="nvim"
    export VISUAL="neovide"
    bindkey -v
else
    export EDITOR="emacsclient -t -a ''"              # $EDITOR use Emacs in terminal
    export VISUAL="emacsclient -c -a emacs"           # $VISUAL use Emacs in GUI mode
fi;

# MacOS Specific config
if [[ "$OSTYPE" == "darwin"* ]]; then
    BREW=/Volumes/MISHA/mybrew
    BREW_BIN=$BREW/bin
    # source "$HOME"/.brew_packages.zsh
    # source "$HOME"/.brewconfig.zsh
    # Turns 'press & hold OS X' false for VSCode
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
    # Prints available space
    # df -H | grep "$HOME" | awk "{printf('\t\t\t\t\tAvailable %s\t\n\'), $4}"
    PATH=$PATH:/usr/local/munki:/Library/Apple/usr/bin
    PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
    PATH=$PATH:$BREW:$BREW_BIN

    # Os X specific aliases
    alias flash="cd /Volumes/MISHA"
    alias gvim="open /Volumes/MISHA/MacOS/Neovide"
    alias neovide="open /Volumes/MISHA/MacOS/Neovide"
fi;

# ZSH config
export plugins=(
    git
    docker
    tmux
    gpg-agent # enables GPG agent 
)

# @Warning: plugins must be exported before oh-my-zsh is sources source $ZSH/oh-my-zsh.sh
source "$HOME"/.oh-my-zsh/oh-my-zsh.sh # it is okay to get warning here, as bashls can't correctly parse ZSH scripts
export ZSH="$HOME/.oh-my-zsh"



# Aliases
alias tks="tmux kill-session -t"
alias vimdiff="nvim -d"
alias vim="nvim"
alias vi="nvim"
alias neovide='neovide --multigrid --nofork -- '
alias vimz="/usr/bin/vi"
alias tmux="tmux -2"

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

alias em="/usr/bin/emacs -nw"
alias emacs="emacsclient -c -a 'emacs'"
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'
alias vifm='./.config/vifm/scripts/vifmrun'
alias ncmpcpp='ncmpcpp ncmpcpp_directory=$HOME/.config/ncmpcpp/'
alias mocp='mocp -M "$XDG_CONFIG_HOME"/moc -O MOCDir="$XDG_CONFIG_HOME"/moc'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

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

# WSL
alias ~~='cd /mnt/c/Users/kuzne/Desktop'

# Opens new Terminal window
function new() {
    if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
        app_name="iTerm"
    else
        app_name="Terminal"
    fi
    
    if [[ $# -eq 0 ]]; then
        open -a "$app_name" "$PWD"
    else
        open -a "$app_name" "$@"
    fi
}

# Asynchronously installs code plugins (spawns zsh instance for each extension)
install_code() {
    for plugin in ${code_plugins[@]}; do
        ( code --install-extension "$plugin" > /dev/null & )
    done
}

vimwiki () {
    if [[ $# == 0 ]]
    then
        nvim +'VimwikiIndex'
    elif [[ $1 == 'git' ]]
    then
        git -C ~/vimwiki/ "@:2"
    else
        echo 'Usage: vimwiki [git] [args ...]'
    fi
}

# Installs brew packages
install_brew() {
    echo "Launching brew installation. Please, wait."

    if [ ! -d "$BREW" ]; then
        echo "Brew dir in goinfre does not exist. Creating it & downloading brew."
        mkdir $BREW
        cd $BREW || exit
        curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $BREW
    fi

    echo -e "Installing the following brew packages ... \n$BREW_PACKAGES"

    # installing of packages
    for package in ${BREW_PACKAGES[@]}; do
        echo -e "Installing \t $package \n"
        ( brew install $package )
    done

    echo "Configuring ctags ..."
    alias ctags="/Volumes/MISHA/mybrew/bin/ctags"

    echo "Installing valgrind for OS X..."
    brew tap LouisBrunner/valgrind
    brew install --HEAD LouisBrunner/valgrind/valgrind
}

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

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

IFS=$SAVEIFS

# Increse / Decrease brightness
set_brightness() {
    if [[ $1 -gt 5 && $1 -lt 101 ]]; then
        xbacklight -set "$1"
        notify-send "Set brigthess to $1%"
    else
        notify-send "Error! Invalid usage of function. Please, provide brigthness in range 5, 100 as a \$1"
    fi;
}

# Asyncronous cleaner script
ccleaner() {
    find ~/ -name ".DS_Store" -print -delete 2>&1 > /dev/null  2>&1 > /dev/null &
    find ~/ -name "**.42_cache_bak**" -print -delete 2>&1 > /dev/null  2>&1 > /dev/null &
    rm -rf ~/.zcompdump*   > /dev/null 2>&1 > /dev/null &1
    rm -rf .Trash/*   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Caches/*   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/42_cache   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Slack/Cache/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Caches/*   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/42_cache   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Slack/Cache/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Slack/Cache/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Developer/CoreSimulator/Caches/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Developer/CoreSimulator/Devices/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Logs/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Google/GoogleSoftwareUpdate/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Containers/com.apple.Safari/Data/Library/Caches/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Code/CachedData/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Slack/logs   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/zoom.us/AutoUpdater   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Google/Chrome/BrowserMetrics/.   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Google/Chrome/BrowserMetrics-spare.pma   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Google/Chrome/GrShaderCache/GPUCache/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Local\ Extension Settings &1 > /dev/null /cjpalhdlnbpafiamejdnhcphjbkeiagm/lost &
    rm -rf ~/Library/Application\ Support/Code/Cache/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Code/CachedExtensionVSIXs/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Code/Code\ Cache/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/CacheStorage/   > /dev/null 2>&1 > /dev/null &1
    rm -rf  ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/ScriptCache/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Google/Chrome/ShaderCache/GPUCache/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Code/CachedExtensions/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Code/logs/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Code/Service\ Worker/CacheStorage/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Code/Service\ Worker/ScriptCache/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage/   > /dev/null 2>&1 > /dev/null &1
    rm -rf ~/.Trash/   > /dev/null 2>&1 &
}

# @TODO: Find better way to do this
# if [ -z "$MY_EXT_IP" ]; then
#     MY_EXT_IP=$(curl ifconfig.me.)
# fi
#
# if [ -z "$MY_PRIV_IP" ]; then
#     MY_PRIV_IP=$(ip addr show | grep -e 'inet ' | grep -v "127" | awk '{print $2}' | cut -f1 -d'/')
# fi 

# ~/ CleanUp
# TODO: watch Luke Smith's vid
# https://www.youtube.com/watch?v=yy8RoDSdhIQ

# export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_STATE_HOME="$HOME/.local/state"

# @W Programs that DO NOT support XDG_BASE_DIR
export LESSHISTFILE="-"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
eval "$(starship init zsh)"
