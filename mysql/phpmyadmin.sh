#!/usr/bin/env bash

docker run -d \
  --network host \
  --name phpmyadmin \
  -e PMA_ARBITRARY=1 \
  -p 8888:80 \
  phpmyadmin/phpmyadmin
