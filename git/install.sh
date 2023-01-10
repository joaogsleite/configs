#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  xcode-select --install
else
  sudo apt install -y git
fi
