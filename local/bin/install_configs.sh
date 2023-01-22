#!/bin/bash

export MYRC="$HOME/myrc"

main() {
	. "$MYRC/configs/special/zprofile"

	# Creates all _DIRS, filters out complex paths as 'path1:path2:path3'
	env | grep -E "(_DIR)[^:]+$" | awk -F'=' '{print $2}' | sed 's/^1$//' | xargs -I _ mkdir -pv _

	find "$MYRC/local/share/applications/" -type f -exec ln -v -sf {} "$XDG_DATA_HOME/applications/" \;
	sudo find "$MYRC/etc/NetworkManager/" -type f -exec ln -v -sf {} "/etc/NetworkManager/conf.d/" \;
	find "$MYRC/local/bin/" -type f -exec ln -v -sf {} "$HOME/.local/bin/" \;
	find "$MYRC/configs/root/" -type f -exec ln -v -sf {} "$XDG_CONFIG_HOME/" \;
	find "$MYRC/configs/" -maxdepth 1 -mindepth 1 -type d | grep -v -E "systemd|root|special" | xargs -I {} ln -v -sf {} "$XDG_CONFIG_HOME/"

	xargs -I _ mkdir -pv _ <<-EOF
		$GNUPGHOME
		$HOME/Public
		$HOME/Personal
		$HOME/Personal/Wallpaper
		$HOME/Personal/MyVault
		$HOME/Personal/Passwords
		$HOME/Documents
		$HOME/Desktop
		$HOME/Projects
		$HOME/Projects/Datagrip
		$HOME/Music
		$HOME/Templates
		$HOME/Downloads
		$HOME/Videos
		$HOME/Screenshots
		$HOME/Pictures
	EOF

	sudo ln -fvs "$HOME/myrc/configs/special/zprofile" /etc/profile.d/zprofile.sh
	sudo ln -fvs "$HOME/myrc/configs/zsh/functions.sh" /etc/profile.d/my_functions.sh
	sudo ln -fvs "$HOME/myrc/configs/environment.d/" /etc/

	sudo chown root:root "$HOME/myrc/configs/environment.d/"
	sudo chmod 755 "$HOME/myrc/configs/environment.d/"

	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

main "$@"
