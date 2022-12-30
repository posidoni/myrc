#!/bin/zsh

bindkey -v
set colored-stats on
setopt cdable_vars

# ZSH config
export plugins=(
    git
    docker
    docker-compose
    golang
    fzf
    tmux
)

# @Warning: plugins must be exported before oh-my-zsh is sources source $ZSH/oh-my-zsh.sh
source "$HOME"/.config/.oh-my-zsh/oh-my-zsh.sh
export ZSH="$HOME/.config/.oh-my-zsh"

# Configs must be exported after oh-my-zsh,
# because I override some aliases
source "$HOME/myrc/configs/zsh/aliases.sh"

eval "$(starship init zsh)"
