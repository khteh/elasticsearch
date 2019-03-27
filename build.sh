#!/bin/bash
$(aws ecr get-login --no-include-email)
docker build -t elasticsearch .
docker tag elasticsearch:latest 701969852130.dkr.ecr.ap-southeast-1.amazonaws.com/elasticsearch:latest
docker push 701969852130.dkr.ecr.ap-southeast-1.amazonaws.com/elasticsearch:latest
docker tag elasticsearch:latest khteh/elasticsearch:latest
docker push khteh/elasticsearch:latest
