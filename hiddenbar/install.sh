#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  brew install --cask jordanbaird-ice
else
  echo "not needed on Linux"
fi
