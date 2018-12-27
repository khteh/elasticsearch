#!/bin/bash
# create and initialize enquiries index
host=0.0.0.0:9200
curl -XDELETE http://$host/enquiries --retry-connrefused --retry 10
echo
curl -XPUT http://$host/enquiries --retry-connrefused --retry 10
echo
curl -XPUT -H "Content-Type: application/json" --data @enquiry_mapping.json http://$host/enquiries/enquiry/_mapping --retry-connrefused --retry 10
echo
