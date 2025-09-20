#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install fzf
  brew install gawk grep gnu-sed coreutils
fi
git clone https://github.com/lincheney/fzf-tab-completion
