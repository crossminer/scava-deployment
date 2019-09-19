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
shopt -s nullglob
DUMPS=(*201*.gz)
NB_DUMPS=${#DUMPS[@]}

DCOUNT=0
for DUMP in "${DUMPS[@]}" ; do
        ((DCOUNT++))
        echo "Restoring (${DCOUNT}/${NB_DUMPS})" && mongorestore  --port 8000 --gzip --quiet --archive=${DUMP}
done

/entrypoint.sh mongod --logpath /var/log/mongodb.log --logappend --port 8000 --shutdown &&
echo "Restore session closed" &&


echo "Starting listening session on port 27017" &&
/entrypoint.sh mongod --logpath /var/log/mongodb.log --logappend &&

# Keep container running
tail -f /dev/null
