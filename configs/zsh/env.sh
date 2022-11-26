#!/bin/bash

# Allows cd into vars
setopt cdable_vars

export win='/mnt/c/Users/kuzne/Desktop'
export conf="$HOME/myrc"
export PATH="$PATH:$GOPATH/bin"

export ZSH_THEME="" # "af-magic" | "spaceship"
export NEOVIDE_MULTIGRID=true

export ZSH_DISABLE_COMPFIX=true
export TERM=xterm-256color
export HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
export HISTORY_IGNORE="(git status|vi|nvim|vim|vimz|ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export EDITOR="nvim"
export VISUAL="nvim"
