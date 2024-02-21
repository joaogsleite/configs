#!/usr/bin/env bash

# WORKSPACES
# disable dynamic workspaces
dconf write /org/gnome/mutter/dynamic-workspaces false
# num workspaces=10
#dconf write /org/gnome/desktop/wm/preferences/num-workspaces 1
# workspace names
#dconf write /org/gnome/desktop/wm/preferences/workspace-names "['1']"
# move and switch workspaces
#for INDEX in 1 2 3 4 5 6 7 8 9 10 .. N
#do
#    if [ $INDEX == 10 ]; then KEY=0; else KEY=$INDEX; fi
#    dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-$INDEX "['<Super>$KEY']"
#    dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-$INDEX "['<Super><Shift>$KEY']"
#done


# Keyboard
# disable PageUp and PageDown on Dell XPS
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'Page_Up'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'ls'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'PageUp'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'Page_Down'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command "'ls'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name "'PageDown'"
# desktop
dconf write /org/gnome/desktop/wm/keybindings/show-desktop "['<Super>d']"
dconf write /org/gnome/desktop/wm/keybindings/cycle-windows "['<Alt>Escape']"
# windows
dconf write /org/gnome/mutter/keybindings/toggle-tiled-left "['<Super>Left']"
dconf write /org/gnome/mutter/keybindings/toggle-tiled-right "['<Super>Right']"
dconf write /org/gnome/desktop/wm/keybindings/maximize "['<Super>Up']"
dconf write /org/gnome/desktop/wm/keybindings/unmaximize "['<Super>Down']"
dconf write /org/gnome/desktop/wm/keybindings/minimize "['<Super>h']"
# monitors
dconf write /org/gnome/desktop/wm/keybindings/move-to-monitor-down "['<Super><Shift>Down']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-monitor-left "['<Super><Shift>Left']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-monitor-right "['<Super><Shift>Right']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-monitor-up "['<Super><Shift>Up']"
# workspaces
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-down "['<Shift><Alt><Super>Down']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-up "['<Shift><Alt><Super>Up']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-down "['<Alt><Super>Down']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-up "['<Alt><Super>Up']"
# change input language keyboard
dconf write /org/gnome/desktop/wm/keybindings/switch-input-source "['<Super>space', 'XF86Keyboard']"


# UI
# wallpaper
#dconf write /org/gnome/desktop/background/picture-options "'none'"
#dconf write /org/gnome/desktop/background/primary-color "'#000000'"
#dconf write /org/gnome/desktop/background/secondary-color "'#000000'"
# show desktop icons
#dconf write /org/gnome/desktop/background/show-desktop-icons true
# theme
dconf write /org/gnome/desktop/interface/gtk-theme "'Yaru-dark'"
# date format on panel
dconf write /org/gnome/desktop/interface/clock-show-date true
dconf write /org/gnome/desktop/interface/clock-show-seconds true
# dock apps
dconf write /org/gnome/shell/favorite-apps "['code.desktop', 'google-chrome.desktop', 'org.gnome.Terminal.desktop']"
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

