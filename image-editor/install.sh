#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  echo "use Pixelmator on macOS"
else
  sudo apt install -y gimp
fi
