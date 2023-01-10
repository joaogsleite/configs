#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install microsoft-office
else
  echo "use Libre Office on Linux"
fi
