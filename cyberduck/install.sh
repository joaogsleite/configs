#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  brew install cyberduck
else
  echo "use Filezilla on Linux"
fi
