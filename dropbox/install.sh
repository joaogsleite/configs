#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask dropbox
else
  echo "use Google Chrome on Linux"
fi
