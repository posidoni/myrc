#!/bin/zsh

# Awesome configuration guide:
# https://thevaluable.dev/zsh-completion-guide-examples/

zmodload -i zsh/complist
autoload -U compaudit compinit && compinit -u -d "$ZSH_COMPDUMP"
WORDCHARS=''
autoload -U +X bashcompinit && bashcompinit

setopt auto_menu
setopt complete_in_word
setopt always_to_end

zstyle ':completion:*' special-dirs true
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $ZSH_COMPDUMP

# INFO: this config uses ${LS_COLORS} ENV that is set in profile file
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:cp:*' file-sort size
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow} [%d] %f'
zstyle ':completion:*:messages' format ' %F{purple}  [%d] %f'
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
zstyle ':completion:*:warnings' format ' %F{red} [no matches found] %f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{green} [%d] %f'
zstyle ':completion:*' file-sort modification

# Small letters also match capital letters
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
