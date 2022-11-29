#!/bin/bash

alias lg="lazygit"
alias tks="tmux kill-session -t"
alias vimdiff="nvim -d"
alias vim="nvim"
alias vi="nvim"
alias vimz="/usr/bin/vim"
alias tmux="tmux -2"
alias code=code --extensions-dir "$XDG_DATA_HOME"/vscode
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
alias zzz="zathura"
alias ff="fzf"
alias fff="fzf"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff="diff --color=auto"
alias ip="ip -color=auto"

# confirm before overwriting something
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"
