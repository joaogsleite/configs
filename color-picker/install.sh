#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  brew install --cask pika
else
  sudo apt install -y gpick
fi
