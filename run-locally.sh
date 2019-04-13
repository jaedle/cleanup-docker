#!/usr/bin/env sh

set -ex
docker image build -t jaedle/cleanup-docker:development .
docker container run --rm -it \
    -v /var/run/docker.sock:/var/run/docker.sock \
    jaedle/cleanup-docker:development
