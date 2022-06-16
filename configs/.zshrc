# File: ZSH Config
# Author: Mikhail Kuznetsov https://github.com/MikhailKuzntsov1
# upd: 16/06/2022

# Including dependencies
source .vscode_ext.zsh
source .clean_cache.zsh
source .brew_packages.zsh

ZSH_THEME="af-magic"

# Prints available space

# MacOS Specific config
    # Turns 'press & hold OS X' false for VSCode
    if [[ "$OSTYPE" == "darwin"* ]] then
        defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
        df -H | grep $HOME | awk '{printf("\t\t\t\t\tAvailable %s\t\n"), $4}'
        export PATH=$PATH:/usr/local/munki:/Library/Apple/usr/bin
        export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
        # Function for launching VSCode (if not available via binary in path)
        # code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
    fi;

# ENV config
    export ZSH="$HOME/.oh-my-zsh"
    export EDITOR="vim"
    export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# ZSH config
    plugins=(git docker docker-compose)
    source $ZSH/oh-my-zsh.sh

# Load Homebrew config script
    source $HOME/.brewconfig.zsh
    export PATH=$PATH:$HOME/goinfre/mybrew/bin

# Aliases
    # alias vg="valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-report.txt"
    alias flash="cd /Volumes/MISHA"
    alias code="code --wait --extensions-dir="/Users/posidoni/goinfre/vscode_ext/extensions""

# Asynchronously installs code plugins (spawns zsh instance for each extension)
install_code() {
    for plugin in ${code_plugins[@]}; do
        ( code --install-extension $plugin > /dev/null & )
    done
}

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

    export PATH=$HOME/goinfre/mybrew:$PATH
}
