#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  sudo apt install -y handbrake
else
  brew install --cask handbrake
fi
