#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  brew install --cask hiddenbar
else
  echo "not needed on Linux"
fi
