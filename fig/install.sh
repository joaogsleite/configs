#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask fig
else
  echo "no alternative for Linux"
fi
