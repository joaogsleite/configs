#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  mas lucky mutekey
else
  echo "install gnome-extension to (un)mute mic"
fi
