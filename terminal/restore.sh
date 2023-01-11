#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  echo "Import theme file into macOS Terminal app"
else
  echo "use default terminal app on Linux"
fi
