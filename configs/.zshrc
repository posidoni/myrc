#!/bin/bash
# File: ZSH Config
# Author: Mikhail Kuznetsov https://github.com/MikhailKuzntsov1
# upd: 16/06/2022

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color
export ZSH_THEME="af-magic"

# MacOS Specific config
if [[ "$OSTYPE" == "darwin"* ]]; then
    export BREW=/Volumes/MISHA/mybrew
    export BREW_BIN=$BREW/bin
    source $HOME/.brew_packages.zsh
    source $HOME/.brewconfig.zsh
    # Turns 'press & hold OS X' false for VSCode
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
    # Prints available space
    df -H | grep $HOME | awk '{printf("\t\t\t\t\tAvailable %s\t\n"), $4}'
    export PATH=$PATH:/usr/local/munki:/Library/Apple/usr/bin
    export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
    export PATH=$PATH:$BREW:$BREW_BIN
fi;

# ENV config
export EDITOR="nvim"
# ZSH config
plugins=(
    git 
    docker
    tmux
    zsh-vi-mode
)
# @Warning: plugins must be exported before oh-my-zsh is sources source $ZSH/oh-my-zsh.sh
source $HOME/.oh-my-zsh/oh-my-zsh.sh
export ZSH="$HOME/.oh-my-zsh"

# Aliases
alias flash="cd /Volumes/MISHA"
alias tks="tmux kill-session -t"
alias vimdiff="nvim -d"
alias vim="nvim"
alias vi="nvim"

alias gvim="/Volumes/MISHA/Neovide --multigrid --nofork -- "
alias neovide='neovide --multigrid --nofork -- '

alias vimz="/usr/bin/vi"
alias tmux="TERM=screen-256color-bce tmux -2"
alias python="/Volumes/MISHA/brew/bin/python3"  
alias python3="/Volumes/MISHA/brew/bin/python3"  
alias python3.9="/Volumes/MISHA/brew/bin/python3"  
alias python@3.9="/Volumes/MISHA/brew/bin/python3"  
alias python@3="/Volumes/MISHA/brew/bin/python3"
export PATH=$PATH:'/Users/posidoni/Library/Python/3.8/bin'
export PATH=$PATH:"$HOME/.local/bin"
export PATH="$PATH:$HOME/bin/"

# Asynchronously installs code plugins (spawns zsh instance for each extension)
install_code() {
    for plugin in ${code_plugins[@]}; do
        ( code --install-extension $plugin > /dev/null & )
    done
}

vimwiki () {
    if [[ $# == 0 ]]
    then
        nvim +'VimwikiIndex'
    elif [[ $1 == 'git' ]]
    then
        git -C ~/vimwiki/ ${@:2}
    else
        echo 'Usage: vimwiki [git] [args ...]'
    fi
}

# Installs brew packages
install_brew() {
    echo "Launching brew installation. Please, wait."

    if [ ! -d "$BREW" ]; then
        echo "Brew dir in goinfre does not exist. Creating it & downloading brew."
        mkdir $BREW
        cd $BREW
        curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $BREW
    fi

    echo -e "Installing the following brew packages ... \n$BREW_PACKAGES"

    # installing of packages
    for package in ${BREW_PACKAGES[@]}; do
        echo -e "Installing \t $package \n"
        ( brew install $package )
    done

    echo "Configuring ctags ..."
    alias ctags="$BREW_BIN/ctags"

    echo "Installing essential casks ..."
    brew install task
    brew install --cask telegram
    brew install --cask fvim
    brew install --cask obs
    brew install --cask notion
    brew install --cask notion-enhanced
    brew install --cask neovide
    # brew install --cask qt-design-studio

    echo "Installing valgrind for OS X..."
    brew tap LouisBrunner/valgrind
    brew install --HEAD LouisBrunner/valgrind/valgrind
}

install_brew_casks() {
    echo "Installing brew casks ..."
    brew install --cask telegram
    brew install --cask fvim
    brew install --cask obs
    brew install --cask notion
    brew install --cask notion-enhanced
    brew install --cask neovide
}

# Asyncronous cleaner script
ccleaner() {
    find ~/ -name ".DS_Store" -print -delete 2>&1 > /dev/null  2>&1 > /dev/null &
    find ~/ -name "**.42_cache_bak**" -print -delete 2>&1 > /dev/null  2>&1 > /dev/null &
    rm -rf ~/.zcompdump*  2>&1 > /dev/null &
    rm -rf .Trash/*  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/  2>&1 > /dev/null &
    rm -rf ~/Library/Caches/*  2>&1 > /dev/null &
    rm -rf ~/Library/42_cache  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/Cache/  2>&1 > /dev/null &
    rm -rf ~/Library/Caches/*  2>&1 > /dev/null &
    rm -rf ~/Library/42_cache  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/Cache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/Cache/  2>&1 > /dev/null &
    rm -rf ~/Library/Developer/CoreSimulator/Caches/  2>&1 > /dev/null &
    rm -rf ~/Library/Developer/CoreSimulator/Devices/  2>&1 > /dev/null &
    rm -rf ~/Library/Logs/  2>&1 > /dev/null &
    rm -rf ~/Library/Google/GoogleSoftwareUpdate/  2>&1 > /dev/null &
    rm -rf ~/Library/Containers/com.apple.Safari/Data/Library/Caches/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/CachedData/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Slack/logs  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/zoom.us/AutoUpdater  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Google/Chrome/BrowserMetrics/.  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Google/Chrome/BrowserMetrics-spare.pma  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Google/Chrome/GrShaderCache/GPUCache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Local\ Extension Settings 2>&1 > /dev/null /cjpalhdlnbpafiamejdnhcphjbkeiagm/lost &
    rm -rf ~/Library/Application\ Support/Code/Cache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/CachedExtensionVSIXs/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/Code\ Cache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/CacheStorage/  2>&1 > /dev/null &
    rm -rf  ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/ScriptCache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Google/Chrome/ShaderCache/GPUCache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/CachedExtensions/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/logs/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/Service\ Worker/CacheStorage/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/Service\ Worker/ScriptCache/  2>&1 > /dev/null &
    rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage/  2>&1 > /dev/null &
    rm -rf ~/.Trash/  2>&1 > /dev/null &
}

