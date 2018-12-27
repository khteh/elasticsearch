#!/bin/bash
# create and initialize patterns index
host=0.0.0.0:9200
# kb
curl -XDELETE http://$host/patterns --retry-connrefused --retry 10
echo
curl -XPUT http://$host/patterns --retry-connrefused --retry 10
echo
curl -XPUT -H "Content-Type: application/json" --data @pattern_mapping.json http://$host/patterns/pattern/_mapping --retry-connrefused --retry 10
echo
