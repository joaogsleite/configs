#!/usr/bin/env bash

# no sudo for docker command
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

# docker folder not accessible
#mkdir -p ~/.docker
#sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
#sudo chmod g+rwx "/home/$USER/.docker" -R
#sudo chmod 666 /var/run/docker.sock
