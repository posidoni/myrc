#!/bin/bash

read -pr "Install nivm packer?" ans

[[ "$ans" =~ [yY] && ! -d "$XDG_DATA_HOME/nvim/site/pack/packer" ]] && git clone --depth 1 https://github.com/wbthomason/packer.nvim "$XDG_DATA_HOME/nvim/site/pack/packer/start/packer.nvim" && nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

sudo ln -s "$HOME/myrc/configs/special/zprofile" /etc/profile.d/zprofile.sh
sudo ln -s "$HOME/myrc/configs/zsh/functions.sh" /etc/profile.d/my_functions.sh
sudo ln -s "$HOME/myrc/configs/environment.d/" /etc/environment.d/

sudo chown root:root "$HOME/myrc/configs/environment.d/"
sudo chmod 755 "$HOME/myrc/configs/environment.d/"
