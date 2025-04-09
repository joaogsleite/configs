#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  brew install --cask betterdisplay
else
  echo "no alternative for Linux yet"
fi
