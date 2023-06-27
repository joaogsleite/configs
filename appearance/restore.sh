#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  defaults write com.apple.dock autohide-delay -float 1000; killall Dock
else
  echo "not yet implemented on Linux"
fi
