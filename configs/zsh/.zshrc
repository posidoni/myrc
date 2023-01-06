#!/bin/zsh

source "$HOME/myrc/configs/zsh/aliases.sh"
source "$HOME/myrc/configs/zsh/comp_setup.sh"

##################################################
### Added by Zinit's installer ###
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
###########################################

zinit wait lucid for \
                    OMZ::lib/git.zsh \
                    OMZ::plugins/git/git.plugin.zsh \
                    OMZP::git \
                    OMZP::kubectl \
                    OMZP::docker-compose \
                    OMZP::docker \
                    zsh-users/zsh-autosuggestions \
                    unixorn/fzf-zsh-plugin \
                    zdharma/fast-syntax-highlighting

bindkey "^F" fzf-file-widget

zinit ice as"command" from"gh-r" atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" atpull"%atclone" src"init.zsh"

zinit light starship/starship
