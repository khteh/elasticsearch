#!/bin/bash
# remove, create and initialize conversations index
host=0.0.0.0:9200
curl -XDELETE http://$host/conversations --retry-connrefused --retry 10
echo
curl -XPUT -H "Content-Type: application/json" --data @settings.json http://$host/conversations --retry-connrefused --retry 10
echo
curl -XPUT -H "Content-Type: application/json" --data @conversation_mapping.json http://$host/conversations/conversation/_mapping --retry-connrefused --retry 10
echo
