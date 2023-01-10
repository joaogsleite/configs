#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  cp ~/Library/Containers/com.dwarvesv.minimalbar/Data/Library/Preferences/com.dwarvesv.minimalbar.plist ./config.plist
fi