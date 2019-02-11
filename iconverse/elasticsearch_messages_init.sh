#!/bin/bash
# remove, create and initialize messages index
host=0.0.0.0:9200
curl -XDELETE http://$host/messages --retry-connrefused --retry 10
echo
curl -XPUT -H "Content-Type: application/json" --data @settings.json http://$host/messages --retry-connrefused --retry 10
echo
curl -XPUT -H "Content-Type: application/json" --data @message_mapping.json http://$host/messages/message/_mapping --retry-connrefused --retry 10
echo
