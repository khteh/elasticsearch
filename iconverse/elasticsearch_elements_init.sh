#!/bin/bash
# create and initialize elements(ontology) index
host=0.0.0.0:9200
# elements
curl -XDELETE http://$host/elements --retry-connrefused --retry 10
echo
curl -XPUT http://$host/elements --retry-connrefused --retry 10
echo
curl -H "Content-Type: application/json" --data @element_mapping.json http://$host/elements/element/_mapping --retry-connrefused --retry 10
echo
