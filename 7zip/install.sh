#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  brew install p7zip
else
  sudo apt install p7zip-full
fi

