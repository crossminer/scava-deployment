#!/usr/bin/env bash

cd scava-metrics
# Import knowledge base dashboard (legacy)
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/scava-project.json
# Import sentiment dashboard
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/scava-sentiment-emotion.json
# Import factoid dashboard
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/scava-factoids.json
# Import QM base dashboard
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/scava-qm.json
# Import overview dashboard
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/scava-overview.json
# Import dependency dashboard
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/scava-dependencies.json
# Import devops dependency dashboard
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/scava-dependencies-devops.json
# Import devops smells dashboard
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/scava-smells-devops.json
# Import user dashboard
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/scava-users.json
# Import user dashboard
kidash -e https://admin:admin@elasticsearch:9200 --kibana-url http://admin:admin@kibiter:5601 --import panels/scava-code.json

sleep 10;

cd ../scava-metrics
# Set index pattern
./setindexpattern.py -k http://admin:admin@kibiter:5601 -ip ea1313b0-8f29-11e8-a362-0d37aacd7dee