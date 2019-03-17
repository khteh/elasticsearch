#!/bin/bash

# Set memlock limit to unlimited
ulimit -n 65536
ulimit -l unlimited
# Call original entrypoint script
exec /usr/local/bin/docker-entrypoint.sh "${@}"
