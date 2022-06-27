#!/bin/bash

OLD_CONFIGS_DIR=$HOME/old_configs

configs=(
    # Editor configs
    .vimrc
	.tmux.conf
	.clang-format

    # Git configs
    .gitmessage
    .gitconfig
    .gitignore_global

    # Shell configs
    .zshrc
        .bashrc
        .brewconfig.zsh
        .brew_packages.zsh
)

install_configs() {
    cd $HOME/myrc/configs

    mkdir $OLD_CONFIGS_DIR

    for file in ${configs[@]}; do
        echo -e "$file is installed!"

        # Save old configs (if they are not a symlink to sth)
        if [[ -L "$HOME/$file" ]]; then
            echo "[WARNING] $HOME/$file - link already exists. Unlinking it"
            unlink $HOME/$file
        fi

        if [[ -f "$HOME/$file" ]]; then
            mv $HOME/$file $OLD_CONFIGS_DIR/$file 2>&1 > /dev/null
        fi

        # Make soft links for every config-file
        ln -s $PWD/$file $HOME/$file 2>&1
        # Install tmux plugin manager
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    done

    # Install NeoVim config
	unlink $HOME/.config/nvim
    mv -r $HOME/.config/nvim $OLD_CONFIGS_DIR
    mkdir $HOME/.config
    mkdir $HOME/.config/nvim
    ln -s $HOME/myrc/configs/nvim $HOME/.config/nvim/
    echo "Nvim is installed!"
}

install_configs
