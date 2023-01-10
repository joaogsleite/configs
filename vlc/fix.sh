#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  echo "nothing to do on macOS"
else 
  sudo apt purge mpv
  sudo apt purge totem
  sudo apt purge rhythmbox
  sudo apt autoremove
fi
