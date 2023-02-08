#!/bin/bash

kill_background_apps() {
	## SO
	## https://stackoverflow.com/questions/43289901/shell-script-for-closing-all-apps-open-dock-via-command-line

	# Creates a comma-separated String of open applications and assign it to the APPS variable.
	APPS=$(osascript -e 'tell application "System Events" to get name of (processes where background only is false)')

	# Convert the comma-separated String of open applications to an Array using IFS.
	# http://stackoverflow.com/questions/10586153/split-string-into-an-array-in-bash
	IFS=',' read -r -a myAppsArray <<< "$APPS"

	for myApp in "${myAppsArray[@]}"
		do
		# shellcheck disable=SC2001 # Sed should be used here
		appName="$(echo "$myApp" | sed 's/^ *//g')" # Remove space character from the start of the Array item

		# Avoid closing the "Finder" and your CLI tool.
		# Note: you may need to change "iTerm" to "Terminal"
		if [[ ! "$appName" == "Finder" && ! "$appName" == "iTerm" ]]; then
			osascript -e 'quit app "'"$appName"'"' # quit app
		fi
	done
}

remap_tilda_macbook_m1() {
	# Remaps '§ to ` and ± to ~'
	# This is needed only for some MacBooks
	# https://apple.stackexchange.com/questions/281405/easy-way-to-remap-non-modifier-keys-on-mac

	hidutil property --set '{"UserKeyMapping":
		[{"HIDKeyboardModifierMappingSrc":0x700000035,
		  "HIDKeyboardModifierMappingDst":0x700000064},
		 {"HIDKeyboardModifierMappingSrc":0x700000064,
		  "HIDKeyboardModifierMappingDst":0x700000035}]
	}'

	cat > "$HOME/Library/LaunchAgents/com.user.loginscript.plist" <<-EOF
	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
	<plist version="1.0">
	<dict>
		<key>Label</key>
		<string>com.user.loginscript</string>
		<key>ProgramArguments</key>
		<array>
			<string>/usr/bin/hidutil</string>
			<string>property</string>
			<string>--set</string>
			<string>{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000035, "HIDKeyboardModifierMappingDst":0x700000064}, {"HIDKeyboardModifierMappingSrc":0x700000064, "HIDKeyboardModifierMappingDst":0x700000035}]}</string>
		</array>
		<key>RunAtLoad</key>
		<true/>
	</dict>
	</plist>
	EOF

	launchctl load ~/Library/LaunchAgents/com.user.loginscript.plist
}


brew_packages=(
	abseil
	aom
	apr
	apr-util
	argon2
	aspell
	assimp
	autoconf
	automake
	awscli
	bash
	bat
	bear
	binutils
	blake3
	boost
	bottom
	brotli
	c-ares
	ca-certificates
	cairo
	calc
	capstone
	cffi
	clickhouse-cpp
	cmake
	cmatrix
	coreutils
	cppcheck
	curl
	dbus
	docker-compose
	docutils
	double-conversion
	dtc
	duf
	ed
	eslint
	ethereum
	exa
	fd
	fmt
	fontconfig
	freetds
	freetype
	fribidi
	fzf
	gawk
	gd
	gdk-pixbuf
	gettext
	giflib
	git-lfs
	glib
	gmp
	gnu-sed
	gnupg
	gnutls
	go
	goose
	graphite2
	grpc
	harfbuzz
	highway
	hunspell
	icu4c
	imath
	jasper
	jpeg-turbo
	jpeg-xl
	jsoncpp
	k6
	kafka
	krb5
	lazydocker
	lazygit
	lf
	libassuan
	libavif
	libb2
	libevent
	libgcrypt
	libgit2
	libgpg-error
	libidn2
	libksba
	liblinear
	libmng
	libnghttp2
	libpng
	libpq
	librsvg
	libslirp
	libsodium
	libssh
	libssh2
	libtasn1
	libtiff
	libtool
	libunistring
	libusb
	libuv
	libvmaf
	libx11
	libxau
	libxcb
	libxdmcp
	libxext
	libxrender
	libzip
	lima
	little-cms2
	llvm
	lua
	lz4
	lzo
	m4
	make
	md4c
	mold
	mpdecimal
	mpfr
	ncurses
	nettle
	ninja
	nlohmann-json
	nmap
	node
	npth
	nvm
	oniguruma
	openexr
	openjdk
	openldap
	openssl@3
	p11-kit
	pandoc
	pango
	pcre
	pcre2
	php
	pinentry
	pinentry-mac
	pixman
	pkg-config
	postgresql@16
	protobuf
	pycparser
	python-setuptools
	python@3.11
	python@3.12
	qemu
	qt
	qt@5
	re2
	readline
	redis
	ripgrep
	rtmpdump
	rustup-init
	shellcheck
	six
	snappy
	spdlog
	sqlite
	starship
	tbb
	tealdeer
	tidy-html5
	tinyxml2
	tmux
	tree
	unbound
	unixodbc
	utf8proc
	vde
	webp
	wget
	xorgproto
	xz
	yarn
	z3
	zookeeper
	zstd
	pipx
	python3
	git-extras # git effort --above 30
	nvm
	solc
	geth
	zellij
)

bootstrap_osx() {
	brew install "${brew_packages[@]}"

	## Python + Ansible
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	pipx install --include-deps ansible
	pipx inject ansible argcomplete
	pipx inject --include-apps ansible argcomplete

	## Configure dock hiding speed & autohiding delay
	defaults write com.apple.dock "autohide-time-modifier" -float "0.5" && killall Dock
	defaults write com.apple.dock "autohide-time-modifier" -float "0" && killall Dock
	defaults write com.apple.dock "autohide" -bool "false" && killall Dock
	defaults write com.apple.dock "autohide-delay" -float "0.2" && killall Dock

	## Fix press & hold annoying stuff
	## https://apple.stackexchange.com/questions/332769/macos-disable-popup-showing-accented-characters-when-holding-down-a-key
	defaults write -g ApplePressAndHoldEnabled -bool false
	defaults write com.apple.Finder AppleShowAllFiles true

	curl https://clickhouse.com/ | sh
}

