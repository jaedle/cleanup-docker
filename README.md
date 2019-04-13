# Cleanup your docker daemon periodically

## Reason

I am running a gitlab worker for building my arm docker images.
Usally it takes a few weeks until the worker is out of disk space.

To prevent this problem I created this small docker utility.

## Cleanup

The following commands will be triggered on startup of the container.

```sh
docker container prune -f
docker volume prune -f
docker image prune -f
```

This will delete all unused containers, unbound volumes and unused images.

After the cleanup-commands are processed the container will delay the cleanup
for the next 24 hours.

## Advise about persistent data

**Please be aware that volumes may contain data that should be persisted!
Use this image only if you don't store any persistent data on docker volumes!**

## Usage

```sh
docker container run \
    -d \
    --restart unless-stopped \
    -v /var/run/docker.sock:/var/run/docker.sock \
    jaedle/cleanup-docker:latest
```

## Parameters

The interval of the cleanup (default 24 hours) can be configured through
the environment variable CLEANUP_RATE specified in seconds.

```sh
docker container run \
    -d \
    --restart unless-stopped \
    -e CLEANUP_RATE=3600 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    jaedle/cleanup-docker:latest
```
