#!/usr/bin/env bash

folder="/org/gnome/shell/extensions/dash-to-panel"

for entry in $(dconf list $folder/)
do
  value=$(dconf read $folder/$entry) 
  echo "dconf write $folder/$entry \"$value\""
done