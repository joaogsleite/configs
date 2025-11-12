#!/usr/bin/env bash

# first arg is workspace letter
LETTER="$1"

# rest of the args are the app name
shift
APP="$@"

# move to workspace of $LETTER
/opt/homebrew/bin/aerospace workspace $LETTER

# check if APP is running, if not => open it
is_running=$(osascript -e "tell application \"$APP\" to running")
if [ "$is_running" = "false" ]; then
  open -a "$APP"
fi
