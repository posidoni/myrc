#!/bin/bash
# Brew packages list
# 
# Xclip is needed for yanking into clipboard & analyzing content of cliboard
# for insert IMG plugin
#
# Bear is needed to create compile_commands.json from make (bear -- make)
#
# LLVM package is needed just because it is nice to have it :)

export BREW_PACKAGES=(
    neovim # Neovim                   
	node # Node
	bear
	ctags
	ripgrep
    task
    markdownlint
    stylua
    black
    flake8
    taskwarrior-tui
	tmux # Tmux
	pkg-config
	shellcheck # Static analysis for bash
    newsboat
    node@16
	xclip # integrates system clipboard with Vim (for pasting imgs into MD)
	clang-format 
	tldr
	check
    fd
    cargo
    rust
    autoconf                gmp                     libksba                 luv                     python@3.10
    automake                gnu-sed                 libnghttp2              m4                      readline
    bdw-gc                  libtasn1                mpdecimal               sqlite
    ca-certificates         gnutls                  libtermkey            	msgpack               tinyxml2
    guile                   libtool                 ncurses                 
    lcov                    libunistring            nettle                  
    cmake                   libassuan               libusb                  npth                    unbound
    cppcheck                libevent                libuv                   openssl@1.1             unibilium
    gcovr                   libffi                  libzip                  p11-kit                utf8proc
    gdbm                    libgcrypt               lua                     pcre                    
    gettext                 libgpg-error            luajit-openresty        pinentry                xz
    gh                      libidn2                 luarocks                zstd
    llvm
    qt
    gnupg
)

