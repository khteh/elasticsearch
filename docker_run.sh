#!/bin/bash
docker run -d -t -p 9101:9100 -p 9201:9200 -p 9301:9300 khteh/iconverse:elasticsearch
