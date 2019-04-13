#!/usr/bin/env sh

while :; do 
    echo '** Starting cleanup.'
    ./cleanup.sh
    echo '** Cleanup done.'

    echo "** Sleeping for: ${CLEANUP_RATE} seconds"
    sleep "$CLEANUP_RATE"
done
