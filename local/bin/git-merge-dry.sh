#!/bin/bash

{ [[ $# -eq 2 ]] && git merge --no-commit --no-ff "$1"; git status; git merge --abort; } \
	|| 1>&2 echo "Usage: $1 - branch to merge into current"
