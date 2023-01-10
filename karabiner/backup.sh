#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  cp ~/.config/karabiner/karabiner.json config.json
fi