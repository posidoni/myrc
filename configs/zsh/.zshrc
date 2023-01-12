#!/bin/zsh

bindkey -v

set colored-stats on
setopt cdable_vars
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt SHARE_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt SHAREHISTORY      # Share history across terminals
setopt INCAPPENDHISTORY  # Immediately append to the history file, not just when a term is killed

export ZSH_COMPDUMP="$XDG_CACHE_HOME/.zcompdump-$HOST"
export HISTFILE="$XDG_CACHE_HOME/zhistory"

source "$HOME/myrc/configs/zsh/aliases.sh"
source "$HOME/myrc/configs/zsh/comp_setup.sh"

eval "$(starship init zsh)"
