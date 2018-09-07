#!/usr/bin/env bash

cd scava-metrics
./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-metrics

kidash -e https://admin:admin@elasticsearch:9200 --import panels/scava-project.json
