#!/usr/bin/env bash


if [ "$(uname)" == "Darwin" ]; then
  echo "not needed on macOS"
  echo "enable Screen Sharing on System Preferences => Sharing"
else
  gsettings set org.gnome.Vino require-encryption false
  gsettings set org.gnome.Vino prompt-enabled false
  /usr/lib/vino/vino-server
fi
