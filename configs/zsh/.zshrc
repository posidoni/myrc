#!/bin/zsh

bindkey -v

# source "$HOME/myrc/configs/zsh/python.sh"

plugins=(
    git
    docker
    kubectl
    tmux
    fzf
    golang
    autoenv
    git-auto-fetch
    gpg-agent
    zoxide
    brew
    helm
    minikube
    rust
    zsh-bat
    # --- Unused
    # gh
    # python
    # pip
    # pyenv
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
source "$HOME/myrc/configs/zsh/kafka.sh"
source "$HOME/myrc/configs/zsh/comp_setup.sh"

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

bindkey "jk" vi-cmd-mode
bindkey "^H" backward-kill-word
bindkey "^N" down-line-or-history
bindkey "^P" up-line-or-history

unset PGSERVICEFILE

source "$HOME/.env"

alias -g -- -h='-h 2>&1 | bat --language=help --style=grid'
alias -g -- --help='--help 2>&1 | bat --language=help --style=grid'

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
