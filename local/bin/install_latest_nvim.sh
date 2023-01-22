#!/bin/bash

# Info:
# Building neovim requires following dependencies:
# Ubuntu/debian: sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
# Arch: sudo pacman -S base-devel cmake unzip ninja tree-sitter curl
# Macos: brew install ninja libtool automake cmake pkg-config gettext curl

# $1 (optional) - path where to clone neovim sources
main() {
	set -euo pipefail # enable strict mode

	local vimdir=${1:-HOME}
	[[ -d "$vimdir" ]] || vimdir=$HOME
	git clone git@github.com:neovim/neovim.git "$vimdir/neovim"
	patch_neovim.sh "$vimdir/neovim"
	cd "$vimdir/neovim"
	make CMAKE_BUILD_TYPE=Release
	sudo make install
}


main "$@"
