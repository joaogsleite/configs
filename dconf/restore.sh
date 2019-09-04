#!/usr/bin/env bash

# WORKSPACES
# disable dynamic workspaces
dconf write /org/gnome/mutter/dynamic-workspaces false
# num workspaces=10
dconf write /org/gnome/desktop/wm/preferences/num-workspaces 1
# workspace names
dconf write /org/gnome/desktop/wm/preferences/workspace-names "['1']"
# move and switch workspaces
#for INDEX in 1 2 3 4 5 6 7 8 9 10 .. N
#do
#    if [ $INDEX == 10 ]; then KEY=0; else KEY=$INDEX; fi
#    dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-$INDEX "['<Super>$KEY']"
#    dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-$INDEX "['<Super><Shift>$KEY']"
#done

# Keyboard
# disable PageUp and PageDown
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'Page_Up'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'ls'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'PageUp'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'Page_Down'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command "'ls'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name "'PageDown'"

# UI
# wallpaper
dconf write /org/gnome/desktop/background/picture-options "'none'"
dconf write /org/gnome/desktop/background/primary-color "'#000000'"
dconf write /org/gnome/desktop/background/secondary-color "'#000000'"
# show desktop icons
dconf write /org/gnome/desktop/background/show-desktop-icons true
# theme
dconf write /org/gnome/desktop/interface/gtk-theme "'Yaru-dark'"
# date format on panel
dconf write /org/gnome/desktop/interface/clock-show-date true
dconf write /org/gnome/desktop/interface/clock-show-seconds true
# dock apps
dconf write /org/gnome/shell/favorite-apps "['code.desktop', 'google-chrome.desktop', 'org.gnome.Terminal.desktop', 'FoxitReader.desktop']"
# enable tree view on Files app
dconf write /org/gnome/nautilus/list-view/use-tree-view true
# show battery percentage
dconf write /org/gnome/desktop/interface/show-battery-percentage true

# SYSTEM
# input source
dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'us'),('xkb', 'pt')]"
# volume above 100%
dconf write /org/gnome/desktop/sound/allow-volume-above-100-percent true
# disable touchpad click
dconf write /org/gnome/desktop/peripherals/touchpad/tap-to-click false
# disable overview open with SUPER key
dconf write /org/gnome/mutter/overlay-key "'Super_L'"
# login user list
dconf write /org/gnome/login-screen/disable-user-list true

