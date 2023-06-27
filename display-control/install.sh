#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  brew install lunar
else
  echo "no alternative for Linux yet"
fi
