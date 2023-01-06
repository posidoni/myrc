#!/bin/bash

alias open="xdg-open"

# Postgres
alias PF="psql postgres://postgres:postgres@localhost:5432/postgres -f" # file
alias PP="psql postgres://postgres:postgres@localhost:5432/postgres" # prompt

alias lg="lazygit"
alias dd="lazydocker"
alias tks="tmux kill-session -t"
[[ -x "/usr/bin/nvim" ]] && alias vim="nvim"
[[ -x "/usr/bin/nvim" ]] && alias vi="nvim"
[[ -x "/usr/bin/nvim" ]] && alias v="nvim"
alias vimz="/usr/bin/vim"

alias tmux="tmux -2"
alias code='code --extensions-dir "$XDG_DATA_HOME/vscode"'
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# LS Aliases
# Order is important
# These are tuned for my needs & may feel a bit strange c:
alias ll="exa -l -g --icons"
alias la="ll -a"
alias ls="exa --icons -F --sort=size"
alias tree="ls -T"
alias t="tree -a -L 1"
alias l="la"

# Better mkdir
alias mkdir="mkdir -p"

# Often used utils aliases
alias rr="ranger"
alias rrr="ranger"
alias zz="zathura"
alias ff="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias fff="ff"

alias grep='grep --color=auto'
alias diff="diff --color=auto"
alias ip="ip -color=auto"

# confirm before overwriting something
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"

# FZF
alias paci="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias pacr="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
