#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  brew install --cask iina
else 
  sudo apt install -y vlc
fi
