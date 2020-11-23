#!/usr/bin/env bash

# use `../dconf/backup-folder.sh` script 
# to generate dconf write commands

# dash-to-panel
dconf write /org/gnome/shell/extensions/dash-to-panel/animate-app-switch "false"
dconf write /org/gnome/shell/extensions/dash-to-panel/animate-show-apps "true"
dconf write /org/gnome/shell/extensions/dash-to-panel/animate-window-launch "false"
dconf write /org/gnome/shell/extensions/dash-to-panel/available-monitors "[0]"
dconf write /org/gnome/shell/extensions/dash-to-panel/click-action "'CYCLE'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-color-1 "'#5294e2'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-color-2 "'#5294e2'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-color-3 "'#5294e2'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-color-4 "'#5294e2'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-color-unfocused-1 "'#5294e2'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-color-unfocused-2 "'#5294e2'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-color-unfocused-3 "'#5294e2'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-color-unfocused-4 "'#5294e2'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-position "'LEFT'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-style-focused "'DOTS'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-style-unfocused "'DOTS'"
dconf write /org/gnome/shell/extensions/dash-to-panel/focus-highlight "true"
dconf write /org/gnome/shell/extensions/dash-to-panel/focus-highlight-color "'#eeeeee'"
dconf write /org/gnome/shell/extensions/dash-to-panel/group-apps "true"
dconf write /org/gnome/shell/extensions/dash-to-panel/hot-keys "true"
dconf write /org/gnome/shell/extensions/dash-to-panel/hotkeys-overlay-combo "'ALWAYS'"
dconf write /org/gnome/shell/extensions/dash-to-panel/isolate-workspaces "true"
dconf write /org/gnome/shell/extensions/dash-to-panel/multi-monitors "false"
dconf write /org/gnome/shell/extensions/dash-to-panel/panel-element-positions "'{\"0\":[{\"element\":\"showAppsButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"activitiesButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"leftBox\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"taskbar\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"centerBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"rightBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"dateMenu\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"systemMenu\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"desktopButton\",\"visible\":false,\"position\":\"stackedBR\"}]}'"
dconf write /org/gnome/shell/extensions/dash-to-panel/panel-positions "'{\"0\":\"LEFT\"}'"
dconf write /org/gnome/shell/extensions/dash-to-panel/scroll-icon-action "'NOTHING'"
dconf write /org/gnome/shell/extensions/dash-to-panel/scroll-panel-action "'NOTHING'"
dconf write /org/gnome/shell/extensions/dash-to-panel/shortcut-previews "false"
dconf write /org/gnome/shell/extensions/dash-to-panel/show-appmenu "false"
dconf write /org/gnome/shell/extensions/dash-to-panel/show-apps-icon-file "''"
dconf write /org/gnome/shell/extensions/dash-to-panel/show-apps-override-escape "true"
dconf write /org/gnome/shell/extensions/dash-to-panel/show-favorites "true"
dconf write /org/gnome/shell/extensions/dash-to-panel/show-running-apps "true"
dconf write /org/gnome/shell/extensions/dash-to-panel/show-tooltip "true"
dconf write /org/gnome/shell/extensions/dash-to-panel/stockgs-keep-dash "false"
dconf write /org/gnome/shell/extensions/dash-to-panel/stockgs-keep-top-panel "false"
dconf write /org/gnome/shell/extensions/dash-to-panel/stockgs-panelbtn-click-only "false"
dconf write /org/gnome/shell/extensions/dash-to-panel/trans-panel-opacity "0.0"
dconf write /org/gnome/shell/extensions/dash-to-panel/trans-use-custom-bg "false"
dconf write /org/gnome/shell/extensions/dash-to-panel/trans-use-custom-opacity "true"

# nothing to say
dconf write /org/gnome/shell/extensions/nothing-to-say/keybinding-toggle-mute '["F4"]'
