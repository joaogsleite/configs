#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  mkdir -p ~/.hammerspoon
  cp ./init.lua ~/.hammerspoon/init.lua
fi
