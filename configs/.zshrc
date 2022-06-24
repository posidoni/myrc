# File: ZSH Config
# Author: Mikhail Kuznetsov https://github.com/MikhailKuzntsov1
# upd: 16/06/2022

# Including dependencies
# source $HOME/myrc/configs/.vscode_ext.zsh
source $HOME/myrc/configs/.brew_packages.zsh

# Set colors to match iTerm2 Terminal Colors

export TERM=xterm-256color
ZSH_THEME="af-magic"

# MacOS Specific config
    # Turns 'press & hold OS X' false for VSCode
    if [[ "$OSTYPE" == "darwin"* ]]; then
        defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
        # Prints available space
        df -H | grep $HOME | awk '{printf("\t\t\t\t\tAvailable %s\t\n"), $4}'
        export PATH=$PATH:/usr/local/munki:/Library/Apple/usr/bin
		export PATH=$PATH:$HOME/goinfre/posidoni/mybrew/bin
        export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
    fi;

# ENV config
    export ZSH="$HOME/.oh-my-zsh"
    export EDITOR="nvim"
    
# ZSH config
    plugins=(
		git 
		docker 
		docker-compose 
		tmux
	)
    source $ZSH/oh-my-zsh.sh

# Load Homebrew config script
    source $HOME/.brewconfig.zsh
    export PATH=$PATH:$HOME/goinfre/mybrew/bin

# Aliases
    alias flash="cd /Volumes/MISHA"
	alias tks="tmux kill-session -t"
	alias vimdiff="nvim -d"
 	alias vim="nvim"
 	alias vi="nvim"
	alias tmux="TERM=screen-256color-bce tmux -2"

# Asynchronously installs code plugins (spawns zsh instance for each extension)
# install_code() {
#     for plugin in ${code_plugins[@]}; do
#         ( code --install-extension $plugin > /dev/null & )
#     done
# }

# Installs brew packages
install_brew() {
    echo "Launching brew installation. Please, wait."

    if [ ! -d "$HOME/goinfre/mybrew" ]; then
        echo "Brew dir in goinfre does not exist. Creating it & downloading brew."
        cd ~
        mkdir ~/goinfre/mybrew
        cd ~/goinfre
        curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C mybrew
    fi

    echo -e "Installing the following brew packages ... \n$brew_packages"

    # installing of packages
    for package in ${brew_packages[@]}; do
        echo -e "Installing \t $package \n"
        ( brew install $package )
    done

    echo "Installing valgrind for OS X..."
    brew tap LouisBrunner/valgrind
    brew install --HEAD LouisBrunner/valgrind/valgrind

    export PATH=$HOME/goinfre/mybrew:$PATH
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
