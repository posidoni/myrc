[alias]
    log = log --graph
    branch = branch -a
    signAll = rebase --exec 'git commit --amend --no-edit -n -S' -i --root
    rr = rebase -i --root # Rebase from root
    cli = restore --staged . # Clear index (staged), unstage everything
    untrack = rm -r --cached # Stop files/dirs from being tracked, but DO NOT delete them physically
    t = tag
    c = checkout
    ck = checkout
    mt = mergetool # Launch mergetool
    clone = clone --recursive
    clonefast = clone --depth 1
    whyignored = check-ignore -v # see why file is ignored
