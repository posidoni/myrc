#!/bin/bash

encodeRMQ() {
    SALT=$(od -A n -t x -N 4 /dev/urandom)
    PASS="$SALT$(echo -n "$1" | xxd -ps | tr -d '\n' | tr -d ' ')"
    PASS="$(echo -n "$PASS" | xxd -r -p | sha256sum | head -c 128)"
    PASS="$(echo -n "$SALT$PASS" | xxd -r -p | base64 | tr -d '\n')"
    echo "$PASS"
}


#!/bin/bash

# Allows cd into vars

load-local-conf() {
     # check file exists, is regular file and is readable:
     if [[ -f "$HOME/.env" && -r "$HOME/.env" ]]; then
       source "$HOME/.env"
     fi
}

restartTouchpad() {
	sudo  modprobe -r psmouse
	sudo modprobe psmouse
}

# Exists to allow using multiple private SSH keys
# $1 - URL to clone from
# $1 - path to private SSH key, $2 - URL to clone from
cloneCustomSSH() {
    if [[ $# -eq 1 ]]; then
        GIT_SSH_COMMAND="ssh -i $HOME/.ssh/sc21-gl -o IdentitiesOnly=yes" git clone "$1"
    elif [[ $# -eq 2 ]]; then
        GIT_SSH_COMMAND="ssh -i $1 -o IdentitiesOnly=yes" git clone "$1"
    else
        cat <<- END
		Error. Incorrect number of arguments!
		Usage:
			$0 repo-url
			$0 path-to-private-ssh repo-url
		END
        return 1
    fi
}

# Connects to machine & starts new tmux session
ssht() {
	/usr/bin/ssh -t "$@" tmux new -A
}

# Finds and reports broken links in $1
findBrokenLinks() {
	find "$1" -type l -exec sh -c 'file -b "$1" | grep -q "^broken"' sh {} \; -print
}

# Extracts common file formats
extract() {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

# C/C++ convenience functions
# prefer 'godbolt.org' for any non-trivial things
getllvm() {
	clang++ -emit-llvm  -Wall -Wextra -S "$1"
}

getasm() {
	clang++ -S -fverbose-asm -Wall -Wextra "$1"
}

getdisasm() {
	objdump -S --disassemble "$1"
}
