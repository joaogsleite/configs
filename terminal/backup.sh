#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  echo "Export theme file from macOS Terminal app"
else
  echo "use default terminal app on Linux"
fi
