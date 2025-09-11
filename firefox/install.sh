#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  brew install --cask firefox
  cd wsbridge/
  ./install.sh
else
  echo "todo..."
fi
