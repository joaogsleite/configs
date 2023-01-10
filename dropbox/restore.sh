#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  echo "After first login: Preferences => Backups"
  echo "* Uncheck 'Show setup notifications when new external drives are plugged-in'"
  echo "* Uncheck 'Enable camera uploads for ...'"
else
  echo "use Google Chrome on Linux"
fi
