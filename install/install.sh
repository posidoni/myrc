#!/bin/bash

# Install plugin managers
[ ! -d "$XDG_DATA_HOME/tmux/tpm" ] && git clone https://github.com/tmux-plugins/tpm "$XDG_DATA_HOME/tmux/tpm"
[ ! -d "$XDG_DATA_HOME/nvim/site/pack/packer" ] && git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 "$XDG_DATA_HOME/nvim/site/pack/packer/start/packer.nvim"

[[ ! -d "$XDG_CONFIG_HOME"/.oh-my-zsh ]] && git clone https://github.com/ohmyzsh/ohmyzsh.git "$XDG_CONFIG_HOME/.oh-my-zsh"

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
