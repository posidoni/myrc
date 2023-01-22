#!/bin/bash

main() {
	pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

	sudo pacman -S man fd exa starship tree pacman-contrib rustup base-devel cmake unzip ninja tree-sitter curl wget python-pip mpdecimal ruby luarocks ripgrep
}

main "$@"
