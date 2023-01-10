#!/usr/bin/env bash

# copy configs folder
if [ "$(uname)" == "Darwin" ]; then
  cp -R ~/Library/Application\ Support/Code/User/* ./config/
else
  cp -R ~/.config/Code/User/* ./config/
fi

# clean configs folder
rm -rf ./config/workspaceStorage/
rm -rf ./config/globalStorage/
rm -rf ./config/History/

# backup extensions list
code --list-extensions > ./extensions.txt
