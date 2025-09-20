#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask gimp
else
  sudo apt install -y gimp
fi
