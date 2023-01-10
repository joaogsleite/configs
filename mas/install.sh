#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install mas
else
  echo "not needed on macOS"
fi
