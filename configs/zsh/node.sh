#!/bin/bash

export NVM_DIR="$XDG_DATA_HOME/nvm"

load_nvm() {
	# mkdir -p "$NVM_DIR"
	# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

	[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"  # This loads nvm
	[[ -s "$NVM_DIR/bash_completion" ]] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}


load_nvm "$@"
