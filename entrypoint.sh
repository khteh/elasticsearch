#!/bin/bash

# Set memlock limit to unlimited
ulimit -n 65536
ulimit -l unlimited
yes | bin/elasticsearch-plugin install repository-s3
# Call original entrypoint script
exec /usr/local/bin/docker-entrypoint.sh "${@}"
