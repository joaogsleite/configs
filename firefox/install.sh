#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  brew install --cask firefox
else
  echo "todo..."
fi
