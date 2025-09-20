#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

osascript -e 'quit app "Hammerspoon"'

brew install --cask hammerspoon

rm -rf $HOME/.hammerspoon
ln -s $PWD/config $HOME/.hammerspoon

open -a Hammerspoon
