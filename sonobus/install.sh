#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask sonobus
else
  sudo snap install sonobus
fi
