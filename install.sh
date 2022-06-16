#!/bin/bash

OLD_CONFIGS_DIR=$HOME/old_configs

configs=(
    # Editor configs
    .vimrc

    # Git configs
    .gitmessage
    .gitconfig
    .gitignore_global

    # Shell configs
    .zshrc
        .bashrc
        .brewconfig.zsh
        .vscode_ext.zsh
        .clean_cache.zsh
        .brew_packages.zsh
)

install_configs() {
    cd configs
    mkdir $OLD_CONFIGS_DIR

    for file in ${configs[@]}; do
        echo -e "$file is installed!"

        # Save old configs (if they are not a symlink to sth)
        if [[ -L "$HOME/$file" ]]; then
            echo "[WARNING] $HOME/$file - link already exists"
        else
            mv $HOME/$file $OLD_CONFIGS_DIR/$file 2>&1 > /dev/null
            # Make soft links for every config-file
            ln -s $PWD/$file $HOME/$file 2>&1
        fi
    done
}

install_configs
