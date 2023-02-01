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

export PATH="$BREW_PATH/opt/gnu-sed/libexec/gnubin:$BREW_PATH/bin:$PATH"

source "$HOME/myrc/configs/zsh/aliases.sh"
source "$HOME/myrc/configs/zsh/functions.sh"
source "$HOME/myrc/configs/zsh/comp_setup.sh"

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

bindkey "jk" vi-cmd-mode
bindkey "^R" history-incremental-search-backward
bindkey "^H" backward-kill-word
bindkey "^N" down-line-or-history
bindkey "^P" up-line-or-history

eval "$(starship init zsh)"
