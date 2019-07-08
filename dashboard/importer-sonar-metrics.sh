#!/usr/bin/env bash

# Import all the Sonar metrics to Elasticsearch to be used in Kibana
cd scava-metrics

if [[ $DASHDEBUG -eq 1 ]]; then
    ./sonarqube2es.py -g -u https://sonarqube.ow2.org -e https://admin:admin@elasticsearch:9200 -i scava-metrics --bulk-size $BULKSIZE --metrics blocker_violations critical_violations coverage test_success_density --components https://ow2-utils.ow2.org/cmr/sonar2scava-project-mapping-ow2.json;
else
    ./sonarqube2es.py -u https://sonarqube.ow2.org -e https://admin:admin@elasticsearch:9200 -i scava-metrics --bulk-size $BULKSIZE --metrics blocker_violations critical_violations coverage test_success_density --components https://ow2-utils.ow2.org/cmr/sonar2scava-project-mapping-ow2.json;
fi
