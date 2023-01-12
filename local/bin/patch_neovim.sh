#!/bin/bash

# Description:
# replaces 'VIMINIT' -> 'NVIMINIT'
# for neovim. Nviminit is a CMD mode string that is executed at neovim
# startup written in vimscript.

# Vim does not conform to XDG DIR spec and requires VIMINIT to be set in a
# specific manner. However, viminit also is read by neovim. There are available
# hacks (e.g. recommended by arch linux wiki), but I don't like them.

# This patch will break some vim dev unit tests, but we are not vim devs, so
# it's fine.

# P.S. This script simply patches source files, it it user's repsonsibility to
# compile modified sources and install neovim.

# $1 - path to neovim dir (root)
main() {
	[[ $# -eq 1 ]] || { 2>&1 echo "Usage: $0 <path_to_nvim_root>"; exit 1; }
	# shellcheck disable=SC2094 # The file must be overwritten
	sed -i 's/VIMINIT/NVIMINIT/g' "$1"/src/nvim/main.c < "$1"/src/nvim/main.c

	# git clone git@github.com:neovim/neovim.git "$HOME/neovim_nightly"
	# make CMAKE_BUILD_TYPE=RelWithDebInfo
	# sudo make install
}

main "$@"
