#!/bin/zsh

bindkey -v

plugins=(
    git
    macos
    brew
    dash
    docker
    gh
    git-auto-fetch
    helm
    kubectl
    minikube
    tmux
)

source "$HOME/myrc/configs/ohmyzsh/oh-my-zsh.sh"

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

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

eval "$(starship init zsh)"
