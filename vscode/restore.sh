#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  cp -R ./config/* ~/Library/Application\ Support/Code/User/
else
  # increase watches size
  echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
  cp -R ./config/* ~/.config/Code/User/
fi
