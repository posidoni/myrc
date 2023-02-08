#!/bin/bash

# () Important: pyenv must be before 'omz' plugins
#
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
