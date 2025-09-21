#!/usr/bin/env bash

# close if running
osascript -e 'quit app "Homerow"'

# install app
brew install --cask homerow

# open app to create initial config files (but close it right away)
open -a Homerow
osascript -e 'quit app "Homerow"'

# set preferences
defaults write com.superultra.Homerow NSStatusItem\ VisibleCC\ Item-0 -bool false
defaults write com.superultra.Homerow SUEnableAutomaticChecks -bool true
defaults write com.superultra.Homerow SUHasLaunchedBefore -bool true
defaults write com.superultra.Homerow SULastCheckTime -date "$(date -u +"%Y-%m-%d %H:%M:%S +0000")"
defaults write com.superultra.Homerow auto-switch-input-source-id -string "com.apple.keylayout.US"
defaults write com.superultra.Homerow enable-hyper-key -bool false
defaults write com.superultra.Homerow hide-labels-when-nothing-is-searched -bool true
defaults write com.superultra.Homerow launch-at-login -bool true
defaults write com.superultra.Homerow non-search-shortcut -string "F17"
defaults write com.superultra.Homerow scroll-shortcut -string "F18"
defaults write com.superultra.Homerow search-shortcut -string "F19"
defaults write com.superultra.Homerow show-menubar-icon -bool false
defaults write com.superultra.Homerow theme-id -string "dark"

# open app
open -a Homerow