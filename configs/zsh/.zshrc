#!/bin/bash

bindkey -v
set colored-stats on

# ZSH config
export plugins=(
    git
    docker
    golang # go subcommands completion
    git-auto-fetch
    magic-enter
    # zsh-vi-mode # better vi mode, see https://github.com/jeffreytse/zsh-vi-mode, may be quite slow
)

# @Warning: plugins must be exported before oh-my-zsh is sources source $ZSH/oh-my-zsh.sh
source "$HOME"/.config/.oh-my-zsh/oh-my-zsh.sh
export ZSH="$HOME/.config/.oh-my-zsh"

# Configs must be exported after oh-my-zsh,
# because I override some aliases
source "$HOME/myrc/configs/zsh/env.sh"
source "$HOME/myrc/configs/zsh/aliases.sh"
source "$HOME/myrc/configs/zsh/functions.sh"

eval "$(starship init zsh)"
