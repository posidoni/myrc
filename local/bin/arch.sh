#!/bin/bash

pacman_packages=(
	man fd exa starship tree pacman-contrib rustup base-devel cmake unzip ninja tree-sitter curl wget python-pip mpdecimal ruby luarocks ripgrep
)

bootstrap_arch() {
	set -euo pipefail # enable strict mode

	pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

	sudo pacman -S "${pacman_packages[@]}"
}
