#!/bin/zsh

######
zstyle ':completion:*' special-dirs true

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zmodload -i zsh/complist


autoload -U compinit; compinit

zstyle ':completion:*:*:cp:*' file-sort size

zstyle ':completion:*' completer _extensions _complete _approximate

zstyle ':completion:*' use-cache on

zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d -!%f'

zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'

zstyle ':completion:*' group-name ''

zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*' file-sort modification
######

bindkey "^F" fzf-file-widget
bindkey "^H" backward-kill-word
bindkey "^N" down-line-or-history
bindkey "^P" up-line-or-history
