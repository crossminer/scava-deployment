#!/usr/bin/env bash

FLAG=0
while true; do
    echo "Starting metrics import..."
    ./importer-scava-metrics.sh 2>/dev/null;
    echo "Metrics imported"
    if [[ $FLAG -eq 0 ]]; then
        echo "Starting panels configuration"
        ./importer-dashboards.sh 2>/dev/null;
        echo "Panels configured"
        FLAG=1;
    fi
    sleep 300;
done
