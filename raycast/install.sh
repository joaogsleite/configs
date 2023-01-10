#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask raycast
else
  echo "use ULauncher on Linux" 
fi
