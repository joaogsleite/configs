#!/usr/bin/env bash

docker run --rm \
    --network host \
    --name emby \
    --volume $PWD/config:/config \
    --volume $HOME/Downloads:/mnt/share1 \
    --device /dev/dri/renderD128 \
    --publish 8096:8096 \
    --publish 8920:8920 \
    -e GIDLIST=$(getent group video | cut -d: -f3) \
    emby/embyserver:latest

