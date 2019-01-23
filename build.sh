#!/bin/bash
docker build -t elasticsearch .
docker tag elasticsearch:latest 701969852130.dkr.ecr.ap-southeast-1.amazonaws.com/elasticsearch:latest
docker push 701969852130.dkr.ecr.ap-southeast-1.amazonaws.com/elasticsearch:latest
