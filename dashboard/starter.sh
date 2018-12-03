#!/usr/bin/env bash

while true; do
    ./importer-scava-metrics.sh;
    ./importer-dashboards.sh;
    sleep 300;
done
