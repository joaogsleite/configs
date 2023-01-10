#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install xquartz
else
  echo "not needed on Linux"
fi
