#!/bin/bash

DEFAULT_NAME=$(date +"%d-%m-%y-%H-%M-%S")
DIRNAME=${1:$DEFAULT_NAME}

mkdir "$DIRNAME"
mkdir "$DIRNAME"/bits
cp "$HOME"/myrc/headers/stdc++.h "$DIRNAME/bits"
g++ -std=c++17 -O2 "$DIRNAME/bits/stdc++.h" -o "$DIRNAME/bits/pch.h"
cd "$DIRNAME" || exit
touch input.txt
touch output.txt
touch errors.txt
touch {A..D}.cc
