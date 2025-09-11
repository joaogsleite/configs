#!/usr/bin/env bash

pnpm install
mkdir -p ~/Library/LaunchAgents
cp com.joaogsleite.wsbridge.plist ~/Library/LaunchAgents/com.joaogsleite.wsbridge.plist
launchctl stop com.joaogsleite.wsbridge || true
launchctl unload ~/Library/LaunchAgents/com.joaogsleite.wsbridge.plist || true
launchctl load ~/Library/LaunchAgents/com.joaogsleite.wsbridge.plist
launchctl start com.joaogsleite.wsbridge
