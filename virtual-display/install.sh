#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask deskpad
else
  echo "No option for Linux yet"
fi
