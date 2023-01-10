#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install mysql
else
  sudo apt update
  sudo apt install -y mysql-client
fi
