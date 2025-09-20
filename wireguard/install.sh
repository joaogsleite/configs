#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install wireguard-go wireguard-tools
else
  sudo apt install -y wireguard
  sudo apt install -y openresolv
fi
