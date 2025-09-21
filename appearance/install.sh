#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  defaults write com.apple.dock autohide-delay -float 1000 # Dock always hidden
  defaults write com.apple.dock persistent-apps -array # clear Dock apps
  defaults write com.apple.dock persistent-others -array # clear Dock folders
  defaults write com.apple.dock show-recents -bool false # clear recent apps in Dock
  defaults write com.apple.dock wvous-br-corner -int 0 # disable right corner
  defaults write com.apple.dock wvous-br-modifier -int 0 # disable right corner
  defaults write com.apple.menuextra.clock ShowSeconds -bool true # clock with seconds
  defaults write com.apple.menuextra.clock ShowDate -int 2 # clock without date
  defaults write com.apple.menuextra.clock ShowDayOfWeek -int 0 # hide weekday
  killall ControlCenter
  killall Dock
fi
