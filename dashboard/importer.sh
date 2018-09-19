#!/usr/bin/env bash

# Import all the Scava metrics to Elasticsearch to be used in Kibana
cd scava-metrics
./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-metrics

# Import the panels with the dashboards to show the Scava metrics imported above
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/scava-project.json
