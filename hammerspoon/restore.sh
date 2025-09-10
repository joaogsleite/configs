#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  mkdir -p ~/.hammerspoon
  cp ./init.lua ~/.hammerspoon/init.lua
  open -a Hammerspoon
  echo 'click on "Reload config"'
fi
