#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  brew install vlc
else 
  sudo apt install -y vlc
fi
