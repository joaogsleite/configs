#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  mkdir -p ~/Library/Containers/com.lowtechguys.rcmd/Data/Library/Preferences/
  cp config.plist ~/Library/Containers/com.lowtechguys.rcmd/Data/Library/Preferences/com.lowtechguys.rcmd.plist
fi