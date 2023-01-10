#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  mkdir -p ~/Library/Containers/com.dwarvesv.minimalbar/Data/Library/Preferences/
  cp ./config.plist ~/Library/Containers/com.dwarvesv.minimalbar/Data/Library/Preferences/com.dwarvesv.minimalbar.plist
fi