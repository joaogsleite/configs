#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  echo "use Parallels on macOS"
else
  sudo adduser $USER vboxusers
fi
