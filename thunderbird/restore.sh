#!/usr/bin/env bash

FILE=~/.thunderbird/$(ls ~/.thunderbird/ | grep .default)/prefs.js
CONTENTS='user_pref("mail.tabs.autoHide", true);'

if grep -q "$CONTENTS" $FILE; then
  echo "Thunderbird already updated"
else
  echo $CONTENTS >> $FILE
fi
