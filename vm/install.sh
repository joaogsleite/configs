#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask utm
else
  echo "Use Virtual Box on Linux"
fi
