#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

if [ "$(uname)" == "Darwin" ]; then

  # quit if running
  osascript -e 'quit app "MacPass"'

  # remove existing config file
  rm -f $HOME/Library/Preferences/com.hicknhacksoftware.MacPass.plist

  # install
  brew install --cask macpass

  # install helper for Raycast
  brew install --cask keepassxc

  # install Autotype plugin
  brew install jq unzip wget
  AUTOTYPE_DOWNLOAD_URL=$(curl -s https://api.github.com/repos/MacPass/AutotypeURL/releases/latest \
    | jq -r '.assets[] | select(.name | test("^Autotype.*\\.zip$")) | .browser_download_url')
  wget -O $HOME/Downloads/Autotype.zip $AUTOTYPE_DOWNLOAD_URL
  mkdir -p $HOME/Library/Application\ Support/MacPass
  rm -rf $HOME/Library/Application\ Support/MacPass/*
  unzip $HOME/Downloads/Autotype.zip -d $HOME/Library/Application\ Support/MacPass
  rm $HOME/Downloads/Autotype.zip

  # open app to create initial config files (but close it right away)
  open -a MacPass
  osascript -e 'quit app "MacPass"'

  # set preferences
  defaults write com.hicknhacksoftware.MacPass AllowRemoteFetchOfPluginRepository -bool true
  defaults write com.hicknhacksoftware.MacPass AutotypeMatchTitle -bool false
  defaults write com.hicknhacksoftware.MacPass AutotypeMatchURL -bool true
  defaults write com.hicknhacksoftware.MacPass EnableGlobalAutotype -bool true
  defaults write com.hicknhacksoftware.MacPass LastDatabasePath -string "file:///Users/joaoleite/Library/Mobile%20Documents/com~apple~CloudDocs/KeePass/keepass.kdbx"
  defaults write com.hicknhacksoftware.MacPass SUEnableAutomaticChecks -bool true
  defaults write com.hicknhacksoftware.MacPass SUHasLaunchedBefore -bool true
  defaults write com.hicknhacksoftware.MacPass kMPASettingsKeyFullMatch -bool true
  defaults write com.hicknhacksoftware.MacPass SULastCheckTime -date "$(date -u +"%Y-%m-%d %H:%M:%S +0000")"
  plutil -insert GlobalAutotypeKeyDataKey -data "YnBsaXN0MDDUAQIDBAUGBwxYJHZlcnNpb25ZJGFyY2hpdmVyVCR0b3BYJG9iamVjdHMSAAGGoF8QD05TS2V5ZWRBcmNoaXZlctIICQoLV2tleUNvZGVdbW9kaWZpZXJGbGFncxAoEgAYASihDVUkbnVsbAgRGiQpMjdJTlZkZmttAAAAAAAAAQEAAAAAAAAADgAAAAAAAAAAAAAAAAAAAHM=" $HOME/Library/Preferences/com.hicknhacksoftware.MacPass.plist

  # example to read a value from plist file:
  plutil -extract GlobalAutotypeKeyDataKey raw $HOME/Library/Preferences/com.hicknhacksoftware.MacPass.plist

else
  read -p "Did you download the .deb file from https://keeweb.info (y/N) " yn
  case $yn in
    [Yy]* ) ;;
    * ) echo "Please download the .deb file first!" ; exit;;
  esac
  sudo dpkg -i ~/Downloads/KeeWeb*.deb
fi
