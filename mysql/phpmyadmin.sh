#!/usr/bin/env bash

docker run --network host --name phpmyadmin -d -e PMA_ARBITRARY=1 -p 8888:80 phpmyadmin/phpmyadmin

