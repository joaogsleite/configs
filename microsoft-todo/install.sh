#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  mas lucky microsoft-todo
else
  echo "no alternative for Linux"
fi
