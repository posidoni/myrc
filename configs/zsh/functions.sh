#!/bin/bash

clear_goenv()
              {
    go env -u GOPROXY
    go env -u GOSUMDB
    go env -u GOPRIVATE
}

sign_wezterm_osx()
                   {
    codesign --force --deep --sign - /Applications/WezTerm.app
}

encodeRMQ()
            {
    SALT=$(od -A n -t x -N 4 /dev/urandom)
    PASS="$SALT$(echo -n "$1" | xxd -ps | tr -d '\n' | tr -d ' ')"
    PASS="$(echo -n "$PASS" | xxd -r -p | sha256sum | head -c 128)"
    PASS="$(echo -n "$SALT$PASS" | xxd -r -p | base64 | tr -d '\n')"
    echo "$PASS"
}

getRandUUIDNoDashes()
                      {
    sed 's/[-]//g' < /proc/sys/kernel/random/uuid
}

restartTouchpad()
                  {
    sudo modprobe -r psmouse
    sudo modprobe psmouse
}

# Connects to machine & starts new tmux session
ssht()
       {
    ssh -t "$@" tmux new -A
}

# Finds and reports broken links in $1
findBrokenLinks()
                  {
    find "$1" -type l -exec sh -c 'file -b "$1" | grep -q "^broken"' sh {} \; -print
}

# Extracts common file formats
extract()
          {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
        echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    else
        for n in "$@"; do
            if [ -f "$n" ]; then
                case "${n%,}" in
                    *.cbt | *.tar.bz2 | *.tar.gz | *.tar.xz | *.tbz2 | *.tgz | *.txz | *.tar)
                        tar xvf "$n"
                        ;;
                    *.lzma)
                        unlzma ./"$n"
                        ;;
                    *.bz2)
                        bunzip2 ./"$n"
                        ;;
                    *.cbr | *.rar)
                        unrar x -ad ./"$n"
                        ;;
                    *.gz)
                        gunzip ./"$n"
                        ;;
                    *.cbz | *.epub | *.zip)
                        unzip ./"$n"
                        ;;
                    *.z)
                        uncompress ./"$n"
                        ;;
                    *.7z | *.arj | *.cab | *.cb7 | *.chm | *.deb | *.dmg | *.iso | *.lzh | *.msi | *.pkg | *.rpm | *.udf | *.wim | *.xar)
                        7z x ./"$n"
                        ;;
                    *.xz)
                        unxz ./"$n"
                        ;;
                    *.exe)
                        cabextract ./"$n"
                        ;;
                    *.cpio)
                        cpio -id < ./"$n"
                        ;;
                    *.cba | *.ace)
                        unace x ./"$n"
                        ;;
                    *)
                        echo "extract: '$n' - unknown archive method"
                        return 1
                        ;;
                esac
            else
                echo 1>&2 "'$n' - file does not exist"
                return 1
            fi
        done
    fi
}

# C/C++ convenience functions
# prefer 'godbolt.org' for any non-trivial things
getllvm()
          {
    clang++ -emit-llvm -Wall -Wextra -S "$1"
}

getasm()
         {
    clang++ -S -fverbose-asm -Wall -Wextra "$1"
}

getdisasm()
            {
    objdump -S --disassemble "$1"
}

githash()
          {
    git rev-parse --short HEAD ||   echo 1>&2 "failed to get git hash"
}

# $1 - img name
builddocker()
              {
    local name="$1"
    if [[ -z "$1" ]]; then
        name="$(pwd | awk -F/ '{print $NF}')"
    fi
    docker build . --tag "$name":"$(githash)"
}
