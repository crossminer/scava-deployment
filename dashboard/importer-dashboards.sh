#!/usr/bin/env bash

cd scava-metrics
# Import knowledge base dashboards
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/scava-project.json
# Import sentiment base dashboards
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/scava-sentiment.json
# Import sentiment base dashboards
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/scava-factoids.json

cd ../sentiment
# Import sentiment dashboards
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/perceval_bugs_emotion_fear.json
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/perceval_bugs_emotions.json

cd ../dependencies
# Import dependencies dashboards
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/dependencies.json

sleep 10;

cd ../scava-metrics
# Set index pattern
./setindexpattern.py -k http://admin:admin@kibiter:5601 -ip ea1313b0-8f29-11e8-a362-0d37aacd7dee