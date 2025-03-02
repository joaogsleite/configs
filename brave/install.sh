#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask brave-browser
else
  echo "todo on linux"
fi
