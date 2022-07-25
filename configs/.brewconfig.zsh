# HOMEBREW CONFIG

# Set Homebrew temporary folders
export HOMEBREW_TEMP=$HOME/goinfre/Homebrew/Temp
export HOMEBREW_CACHE=$HOME/goinfre/Homebrew/Temp/Caches

mkdir -p $HOMEBREW_CACHE
mkdir -p $HOMEBREW_TEMP

# If NFS session
# Symlink Locks folder in /tmp
if df -T autofs,nfs $HOME 1>/dev/null
then
  HOMEBREW_LOCKS_TARGET=$HOME/goinfre/.Homebrew/Temp/Locks
  HOMEBREW_LOCKS_FOLDER=$BREW/var/homebrew

  mkdir -p $HOMEBREW_LOCKS_TARGET
  mkdir -p $HOMEBREW_LOCKS_FOLDER

  # Symlink to Locks target folders
  # If not already a symlink
  if ! [[ -L $HOMEBREW_LOCKS_FOLDER && -d $HOMEBREW_LOCKS_FOLDER ]]
  then
     echo "Creating symlink for Locks folder"
     rm -rf $HOMEBREW_LOCKS_FOLDER
     ln -s $HOMEBREW_LOCKS_TARGET $HOMEBREW_LOCKS_FOLDER
  fi
fi
