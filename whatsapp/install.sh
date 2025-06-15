#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  mas install 310633997 # WhatsApp Messenger
else
  echo "use WhatsApp Web on Linux"
fi
