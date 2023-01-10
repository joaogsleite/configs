#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  brew install wget
else
  sudo apt install -y wget
fi
