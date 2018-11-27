#!/bin/bash

# Initialize a mongo data folder and logfile
mkdir -p /data/db
touch /var/log/mongodb.log
chmod 777 /var/log/mongodb.log

# Start mongodb with logging
# --logpath    Without this mongod will output all log information to the standard output.
# --logappend  Ensure mongod appends new entries to the end of the logfile. We create it first so that the below tail always finds something
/entrypoint.sh mongod --logpath /var/log/mongodb.log --logappend --port 8000 &

# Wait until mongo logs that it's ready (or timeout after 60s)
COUNTER=0
grep -q 'waiting for connections on port' /var/log/mongodb.log
while [[ $? -ne 0 && $COUNTER -lt 60 ]] ; do
    sleep 2
    let COUNTER+=2
    echo "Waiting for mongo to initialize... ($COUNTER seconds so far)"
    grep -q 'waiting for connections on port' /var/log/mongodb.log
done

# Restore from dump

mongorestore  --port 8000 --drop --gzip --archive=JDBM.2018.11.16.gz &&
mongorestore  --port 8000 --drop --gzip --archive=JDBM3.2018.11.16.gz &&
mongorestore  --port 8000 --drop --gzip --archive=Jest.2018.11.16.gz &&
mongorestore  --port 8000 --drop --gzip --archive=SVNKIT.2018.11.16.gz &&
mongorestore  --port 8000 --drop --gzip --archive=elasticsearch-java-client.2018.11.16.gz &&
mongorestore  --port 8000 --drop --gzip --archive=elasticsearchjava.2018.11.16.gz &&
mongorestore  --port 8000 --drop --gzip --archive=elasticsearchjavaclient.2018.11.16.gz &&
mongorestore  --port 8000 --drop --gzip --archive=emf.2018.11.16.gz &&
mongorestore  --port 8000 --drop --gzip --archive=gef.2018.11.16.gz &&
mongorestore  --port 8000 --drop --gzip --archive=netty.2018.11.16.gz &&
mongorestore  --port 8000 --drop --gzip --archive=scava-analysis.2018.11.16.gz &&
mongorestore  --port 8000 --drop --gzip --archive=scava.2018.11.16.gz &&
mongorestore  --port 8000 --drop --gzip --archive=spring-elasticsearch.2018.11.16.gz &&
mongorestore  --port 8000 --drop --gzip --archive=springelasticsearch.2018.11.16.gz &&


/entrypoint.sh mongod --port 8000 --shutdown

/entrypoint.sh mongod &

# Keep container running
tail -f /dev/null
