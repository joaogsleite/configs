#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask macpass
else
  echo "use Keeweb on Linux"
fi
