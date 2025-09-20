#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask handbrake
else
  sudo apt install -y handbrake
fi
