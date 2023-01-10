#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  brew install --cask karabiner-elements
else
  echo "not needed on Linux"
fi
