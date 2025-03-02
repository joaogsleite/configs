#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask microsoft-edge
else
  echo "todo for linux"
fi
