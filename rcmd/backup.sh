#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  cp ~/Library/Containers/com.lowtechguys.rcmd/Data/Library/Preferences/com.lowtechguys.rcmd.plist config.plist
fi