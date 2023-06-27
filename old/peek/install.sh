#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  echo "use QuickTime Player on macOS"
else
  sudo add-apt-repository -y ppa:peek-developers/stable
  sudo apt update -y
  sudo apt install -y peek
fi
