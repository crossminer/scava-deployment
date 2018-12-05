#!/usr/bin/env bash

FLAG=0
while true; do
    ./importer-scava-metrics.sh;

    if [[ $FLAG -eq 0 ]]; then
        ./importer-dashboards.sh;
        FLAG=1;
    fi
    sleep 300;
done
