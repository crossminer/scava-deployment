#!/usr/bin/env bash

# Import all the OMM metrics to Elasticsearch to be used in Kibana
cd scava-metrics

if [[ $DASHDEBUG -eq 1 ]]; then
    ./omm2es.py -g -u https://gist.githubusercontent.com/valeriocos/1d5215d6ea212d3ecfc909492aad656e/raw/8910fb62de9f29aa5f6fe4e288f923b9af81a336/gistfile1.txt -e https://admin:admin@elasticsearch:9200 -i scava-metrics --bulk-size $BULKSIZE;
else
    ./omm2es.py -u https://gist.githubusercontent.com/valeriocos/1d5215d6ea212d3ecfc909492aad656e/raw/8910fb62de9f29aa5f6fe4e288f923b9af81a336/gistfile1.txt -e https://admin:admin@elasticsearch:9200 -i scava-metrics --bulk-size $BULKSIZE;
fi
