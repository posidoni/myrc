#!/bin/bash

OLD_CONFIGS_DIR=$HOME/old_configs

configs=(
    .zshrc
    .bashrc
    .vimrc
    .brewconfig.zsh
    .gitmessage
    .gitconfig
    .gitignore_global
    .vscode_ext.zsh
    .clean_cache.zsh
    .brew_packages.zsh
)

install_configs() {
    cd configs
    mkdir $OLD_CONFIGS_DIR

    for file in ${configs[@]}; do
        echo -e "$file is installed!"
        # Save old configs
        mv $HOME/$file $OLD_CONFIGS_DIR/$file 2>&1 > /dev/null
        # Make soft links for every config-file
        ln -s $PWD/$file $HOME/$file 2>&1
    done
}

install_configs
