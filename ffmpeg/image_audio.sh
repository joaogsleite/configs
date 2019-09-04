#!/usr/bin/env bash

ffmpeg -loop 1 -framerate 1 -i $IMAGE -i $AUDIO \
-c:v libx264 -preset veryslow -crf 0 -c:a copy -shortest $OUTPUT.mkv
