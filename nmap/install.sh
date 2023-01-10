#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install nmap
else
  sudo apt update
  sudo apt install -y nmap
fi
