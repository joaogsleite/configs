#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  brew install --cask transmission
else
  sudo apt install -y transmission
fi
