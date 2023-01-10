#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  mas lucky rcmd
else
  echo "no alternative for Linux"
fi
