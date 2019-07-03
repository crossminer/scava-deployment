#!/usr/bin/env bash

# Import all the Sonar metrics to Elasticsearch to be used in Kibana
cd scava-metrics

if [[ $DASHDEBUG -eq 1 ]]; then
    ./sonarqube2es.py -g -u https://sonarqube.ow2.org -e https://admin:admin@elasticsearch:9200 -i scava-metrics --bulk-size $BULKSIZE --components ASM:asm clif-legacy --metrics blocker_violations critical_violations coverage test_success_density;
else
    ./sonarqube2es.py -u https://sonarqube.ow2.org -e https://admin:admin@elasticsearch:9200 -i scava-metrics --bulk-size $BULKSIZE --components ASM:asm clif-legacy --metrics blocker_violations critical_violations coverage test_success_density;
fi
