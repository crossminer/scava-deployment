#!/usr/bin/env bash

# Import all the OMM metrics to Elasticsearch to be used in Kibana
cd scava-metrics

if [[ $DASHDEBUG -eq 1 ]]; then
    ./omm2es.py -g -u https://gist.githubusercontent.com/valeriocos/1d5215d6ea212d3ecfc909492aad656e/raw/dfc48100e323d9f17e0fd3c13af35e4393bcba7d/gistfile1.txt -e https://admin:admin@elasticsearch:9200 -i scava-metrics --bulk-size $BULKSIZE --project test;
else
    ./sonarqube2es.py -u https://gist.githubusercontent.com/valeriocos/1d5215d6ea212d3ecfc909492aad656e/raw/dfc48100e323d9f17e0fd3c13af35e4393bcba7d/gistfile1.txt -e https://admin:admin@elasticsearch:9200 -i scava-metrics --bulk-size $BULKSIZE --project test;
fi
