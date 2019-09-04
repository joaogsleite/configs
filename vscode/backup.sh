#!/usr/bin/env bash

cp -R ~/.config/Code/User/* ./config/
rm -rf ./config/workspaceStorage/
rm -rf ./config/globalStorage/
code --list-extensions > ./extensions.txt
