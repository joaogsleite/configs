#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  rm -rf ~/.hammerspoon
  cp -r code/ ~/.hammerspoon/ 
  open -a Hammerspoon
  echo 'click on "Reload config"'
fi
