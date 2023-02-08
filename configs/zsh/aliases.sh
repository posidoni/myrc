#!/bin/bash

if [[ "$OSTYPE" =~  darwin ]]; then
	alias clip="pbcopy"
	alias clipboard="pbcopy"
	alias cl="pbcopy"
	alias date="gdate"
	alias awk="gawk"
	alias sed="gsed"
fi

## Fuzzy file search
alias v="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' | xargs nvim"
bindkey -s '^F' 'v \n'

alias mk="minikube"
alias kctx="kubectx"
alias kns="kubens"
alias m="make"
alias lg="lazygit"
alias dd="lazydocker"
alias kk="k9s"
alias tt="tmux"
alias tks="tmux kill-session -t"

# shellcheck disable=SC2139
alias vv="$(which vim)"
alias vim="nvim"
alias vi="nvim"

alias tmux="tmux -2"
alias code='code --extensions-dir "$XDG_DATA_HOME/vscode"'
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# LS Aliases, may feel a bit weird, tuned for me
alias ll="exa -l -g --git --icons"
alias la="exa -la -g --git --icons"
alias l="exa -l -g --git --icons"
alias ls="exa --icons -F --git --sort=size"

t() { # tree with default depth (1) overridable with '$1'
	exa --icons -F -T -a -L "${1:-1}"
}

# Better mkdir
alias mkdir="mkdir -pv"

# Often used utils aliases
alias rr="lf ."
alias rrr="lf ."

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

# 🦀 Rust alternatives
alias du="dust"
alias cat="bat"
alias ps="procs"
alias top="btm"
alias htop="btm"

alias av="avito"
