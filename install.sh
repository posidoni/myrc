#!/bin/bash

# Generate a list of strings

OLD_CONFIGS_DIR=$HOME/old_configs

conf_configs=(
    
)

home_configs=(
    .zshrc
    .tmux.conf
    .xinitrc
    .Xmodmap
    .Xresources
    .zprofile
    .bashrc
)

osx_home_configs=(
    .brewconfig.zsh
    .brew_packages.zsh
)

install_home_configs() {
    for conf in "$home_configs[@]" do
        echo "12"
    fi;
}

install_configs() {
    cd "$HOME/myrc/configs" || exit

    mkdir "$OLD_CONFIGS_DIR"

}

install_xmonad_hooks() {
    echo "Installing xmonad pacman hooks ..."
    cp "$HOME"/myrc/xmonad/pacman-hooks/* /etc/pacman.d/hooks/
}

install_configs
