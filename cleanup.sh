#!/usr/bin/env sh

set -e

echo 'Deleting stopped containers'
docker container prune -f

echo 'Deleting unusued volumes'
docker volume prune -f

echo 'Deleting unused images'
docker image prune -a -f
