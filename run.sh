#!/bin/bash
set -x
#ulimit -l unlimited
ulimit -n 65536
sudo chown -R elasticsearch:elasticsearch /var/lib/elasticsearch
sudo -u elasticsearch /usr/share/elasticsearch/bin/elasticsearch -p /var/run/elasticsearch/elasticsearch.pid -d
cd /opt/iconverse && ./iconverse_elasticsearch_init.sh
kill -KILL `cat /var/run/elasticsearch/elasticsearch.pid`
sudo -u elasticsearch /usr/share/elasticsearch/bin/elasticsearch -p /var/run/elasticsearch/elasticsearch.pid
# Call original entrypoint script
#exec /usr/local/bin/docker-entrypoint.sh "${@}"
