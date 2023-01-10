#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  echo "not needed on macOS"
  echo "enable Remote Login on System Preferences => Sharing"
else
  sudo apt install -y openssh-server 
fi
