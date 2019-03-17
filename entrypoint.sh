#!/bin/bash

# Set memlock limit to unlimited
ulimit -l unlimited
# Call original entrypoint script
exec /usr/local/bin/docker-entrypoint.sh "${@}"
