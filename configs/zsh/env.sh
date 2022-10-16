#!/bin/bash

# Allows cd into vars
setopt cdable_vars

# WSL things
export win='/mnt/c/Users/kuzne/Desktop'
export conf="$HOME/myrc"

export ZSH_THEME="" # "af-magic" | "spaceship"
export NEOVIDE_MULTIGRID=1

export ZSH_DISABLE_COMPFIX=true
export TERM=xterm-256color
export HISTORY_IGNORE="(git status|vi|nvim|vim|vimz|ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# @W Programs that DO NOT support XDG_BASE_DIR

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

export EDITOR="nvim"
export VISUAL="nvim"
