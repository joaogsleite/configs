#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  echo "already pre-installed on macOS"
else
  sudo apt install -y vim
fi
