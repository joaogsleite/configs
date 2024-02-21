#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask iina
else
  echo "use VLC on Linux"
fi