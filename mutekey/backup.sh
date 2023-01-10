#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  cp ~/Library/Containers/com.davechengapps.GlobalMute/Data/Library/Preferences/com.davechengapps.GlobalMute.plist config.plist
fi