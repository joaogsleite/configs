#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask wireguard
else
  sudo apt install -y wireguard
  sudo apt install -y openresolv
fi
