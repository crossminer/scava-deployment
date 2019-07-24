#!/usr/bin/env bash

FLAG=0
while true; do
    ./importer-scava-metrics.sh;
    ./importer-omm-metrics.sh;

    if [[ $FLAG -eq 0 ]]; then
        ./importer-dashboards.sh;
        curl -XPUT https://admin:admin@elasticsearch:9200/scava-metrics-done --insecure
        FLAG=1;
    fi
    sleep 300;
done
