#!/bin/bash
export EDITOR=/usr/bin/nvim
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
setxkbmap -option caps:swapescape
export MY_EXT_IP=$(curl ifconfig.me.)
export MY_PRIV_IP=$(ip addr show | grep -e 'inet ' | grep -v "127" | awk '{print $2}' | cut -f1 -d'/')
