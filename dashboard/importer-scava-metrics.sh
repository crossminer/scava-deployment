#!/usr/bin/env bash

# Import all the Scava metrics to Elasticsearch to be used in Kibana
cd scava-metrics

if [[ $DASHDEBUG -eq 1 ]]; then
    ./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-metrics --category metric;
    ./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-factoids --category factoid;
    ./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-dev-deps --category dev-dependency;
    ./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-conf-deps --category conf-dependency;
else
    ./scava2es.py -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-metrics --category metric;
    ./scava2es.py -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-factoids --category factoid;
    ./scava2es.py -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-dev-deps --category dev-dependency;
    ./scava2es.py -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-conf-deps --category conf-dependency;
fi
