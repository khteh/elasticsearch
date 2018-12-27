#!/bin/bash
# remove, create and initialize systems index
host=0.0.0.0:9200
curl -XDELETE http://$host/systems --retry-connrefused --retry 10
echo
curl -XPUT -H "Content-Type: application/json" --data @settings.json http://$host/systems --retry-connrefused --retry 10
echo
curl -XPUT -H "Content-Type: application/json" --data @system_mapping.json http://$host/systems/system/_mapping --retry-connrefused --retry 10
echo
