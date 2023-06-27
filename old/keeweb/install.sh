#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  echo "use MacPass on macOS"
else
  # download .deb from https://keeweb.info/
  sudo dpkg -i *.deb
fi
