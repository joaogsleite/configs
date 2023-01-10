#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  mkdir -p ~/Library/Containers/com.davechengapps.GlobalMute/Data/Library/Preferences/
  cp config.plist ~/Library/Containers/com.davechengapps.GlobalMute/Data/Library/Preferences/com.davechengapps.GlobalMute.plist
fi