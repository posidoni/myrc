setxkbmap -option caps:swapescape
export MY_EXT_IP=$(curl ifconfig.me.)
export MY_PRIV_IP=$(ip addr show | grep -e 'inet ' | grep -v "127" | awk '{print $2}' | cut -f1 -d'/')
echo "I am alive!!!"
