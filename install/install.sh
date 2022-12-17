#!/bin/bash

# Install plugin managers
[ ! -d "$HOME/.local/share/tmux/tpm" ] && git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/tpm
[ ! -d "$HOME/.local/share/nvim/site/pack/packer" ] && git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
