#!/bin/bash

# Initialize a mongo data folder and logfile
mkdir -p /data/db
rm /var/log/mongodb.log
touch /var/log/mongodb.log
chmod 777 /var/log/mongodb.log

echo "Starting DB repair"
/entrypoint.sh mongod --repair --logpath /var/log/mongodb.log --logappend --port 8001

echo "Starting restore session"

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


echo "Restoring (0/14)" &&
mongorestore  --port 8000 --gzip --quiet --archive=JDBM.2018.11.16.gz &&
echo "Restoring (1/14)" &&
mongorestore  --port 8000 --gzip --quiet --archive=JDBM3.2018.11.16.gz &&
echo "Restoring (2/14)" &&
mongorestore  --port 8000 --gzip --quiet --archive=Jest.2018.11.16.gz &&
echo "Restoring (3/14)" &&
mongorestore  --port 8000 --gzip --quiet --archive=SVNKIT.2018.11.16.gz &&
echo "Restoring (4/14)" &&
mongorestore  --port 8000 --gzip --quiet --archive=elasticsearch-java-client.2018.11.16.gz &&
echo "Restoring (5/14)" &&
mongorestore  --port 8000 --gzip --quiet --archive=elasticsearchjava.2018.11.16.gz &&
echo "Restoring (6/14)" &&
mongorestore  --port 8000 --gzip --quiet --archive=elasticsearchjavaclient.2018.11.16.gz &&
echo "Restoring (7/14)" &&
mongorestore  --port 8000 --gzip --quiet --archive=emf.2018.11.16.gz &&
echo "Restoring (8/14)" &&
mongorestore  --port 8000 --gzip --quiet --archive=gef.2018.11.16.gz &&
echo "Restoring (9/14)" &&
mongorestore  --port 8000 --gzip --quiet --archive=netty.2018.11.16.gz &&
echo "Restoring (10/14)" &&
mongorestore  --port 8000 --gzip --quiet --archive=scava-analysis.2018.11.16.gz &&
echo "Restoring (11/14)" &&
mongorestore  --port 8000 --gzip --quiet --archive=scava.2018.11.16.gz &&
echo "Restoring (12/14)" &&
mongorestore  --port 8000 --gzip --quiet --archive=spring-elasticsearch.2018.11.16.gz &&
echo "Restoring (13/14)" &&
mongorestore  --port 8000 --gzip --quiet --archive=springelasticsearch.2018.11.16.gz &&
echo "Restoring (14/14)" &&

/entrypoint.sh mongod --logpath /var/log/mongodb.log --logappend --port 8000 --shutdown &&
echo "Restore session closed" &&


echo "Starting listening session on port 27017" &&
/entrypoint.sh mongod --logpath /var/log/mongodb.log --logappend &&

# Keep container running
tail -f /dev/null
