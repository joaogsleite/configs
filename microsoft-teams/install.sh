#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask microsoft-teams
else
  # download deb from internet
  sudo dpkg -i *.deb
fi
