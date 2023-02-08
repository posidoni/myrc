#!/bin/bash


regen_env() {
	# Regenerates system-wide env file in systemd
	# format to match `.zprofile`

	if [[ "$OSTYPE" =~ darwin|DARWIN ]]; then
		1>&2 echo "$OSTYPE not supported for this script"
		return 1
	fi

	awk '
		BEGIN{
			FS="[ =#]+"
		}

		/export/{
			printf("%s=%s\n", $2, $3)
	}' < "$HOME/myrc/configs/special/zprofile" | grep -v -i -E "viminit|manpager" | sudo tee "$HOME/myrc/configs/environment.d/00-env_from_profile.conf"
}

