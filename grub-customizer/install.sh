#!/usr/bin/env bash

# BEFORE INSTALL:
# add `nouveau.modeset=0` until nvidia drivers are installed

# installing grub-customizer
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install -y grub-customizer

# AFTER INSTALL:
# add `acpi_rev_override nouveau.modeset=0 verbose net.ifnames=0 biosdevname=0`
