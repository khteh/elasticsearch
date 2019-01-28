#!/bin/bash
# create and initialize fluentd index
host=0.0.0.0:9200
curl -XDELETE http://$host/fluentd --retry-connrefused --retry 10
echo
curl -XPUT http://$host/fluentd --retry-connrefused --retry 10
echo
curl -XPUT -H "Content-Type: application/json" --data @enquiry_mapping.json http://$host/fluentd/enquiry/_mapping --retry-connrefused --retry 10
echo
