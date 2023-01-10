#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  mkdir -p ~/.config/karabiner
  cp ./config.json ~/.config/karabiner/karabiner.json
fi