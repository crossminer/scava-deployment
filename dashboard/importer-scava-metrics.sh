#!/usr/bin/env bash

# Import all the Scava metrics to Elasticsearch to be used in Kibana
cd scava-metrics

if [[ $DASHDEBUG -eq 1 ]]; then
    ./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-metrics --category metric --bulk-size $BULKSIZE;
    ./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-topics --category topic --bulk-size $BULKSIZE;
    ./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-factoids --category factoid --bulk-size $BULKSIZE;
    ./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-dev-deps --category dev-dependency --bulk-size $BULKSIZE;
    ./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-conf-deps --category conf-dependency --bulk-size $BULKSIZE;
    ./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-dep-versions --category version-dependency --bulk-size $BULKSIZE;
    ./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-users --category user --bulk-size $BULKSIZE;
    ./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 --recommendation-url http://kb-service:8080/api -i scava-recommendations --category recommendation --bulk-size $BULKSIZE;
    ./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-conf-smells --category conf-smell --bulk-size $BULKSIZE;
    ./scava2es.py -g -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-project-relations --category project-relation --bulk-size $BULKSIZE;
else
    ./scava2es.py -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-metrics --category metric --bulk-size $BULKSIZE;
    ./scava2es.py -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-topics --category topic --bulk-size $BULKSIZE;
    ./scava2es.py -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-factoids --category factoid --bulk-size $BULKSIZE;
    ./scava2es.py -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-dev-deps --category dev-dependency --bulk-size $BULKSIZE;
    ./scava2es.py -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-conf-deps --category conf-dependency --bulk-size $BULKSIZE;
    ./scava2es.py -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-dep-versions --category version-dependency --bulk-size $BULKSIZE;
    ./scava2es.py -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-users --category user --bulk-size $BULKSIZE;
    ./scava2es.py -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 --recommendation-url http://kb-service:8080/api -i scava-recommendations --category recommendation --bulk-size $BULKSIZE;
    ./scava2es.py -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-conf-smells --category conf-smell --bulk-size $BULKSIZE;
    ./scava2es.py -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-project-relations --category project-relation --bulk-size $BULKSIZE;
fi

if [[ $SYNC_ES_SCAVA -eq 1 ]]; then
    ./synccontent.py -u http://oss-app:8182 -e https://admin:admin@elasticsearch:9200 -i scava-metrics scava-factoids scava-dev-deps scava-conf-deps scava-dep-versions scava-recommendations scava-conf-smells scava-project-relations;
fi
