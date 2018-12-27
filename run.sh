#!/bin/bash
set -x
#sudo -u elasticsearch /usr/share/elasticsearch/bin/elasticsearch -p /var/run/elasticsearch/elasticsearch.pid -d
#cd /opt/iconverse
#./iconverse_elasticsearch_init.sh
#cd /usr/src/elasticsearch-head
#npm run start
sudo -u elasticsearch /usr/share/elasticsearch/bin/elasticsearch -p /var/run/elasticsearch/elasticsearch.pid -d
/opt/iconverse/iconverse_elasticsearch_init.sh
kill -KILL `cat /var/run/elasticsearch/elasticsearch.pid`
sudo -u elasticsearch /usr/share/elasticsearch/bin/elasticsearch -p /var/run/elasticsearch/elasticsearch.pid
