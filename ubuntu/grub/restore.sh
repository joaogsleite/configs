#!/usr/bin/env bash

sudo sed -i 's/GRUB_TIMEOUT=0/GRUB_TIMEOUT=10/' /etc/default/grub
sudo sed -i 's/GRUB_TIMEOUT_STYLE="hidden"/#GRUB_TIMEOUT_STYLE="hidden"/' /etc/default/grub

sudo update-grub