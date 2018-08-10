######################################################################
# Copyright (c) 2017-2018 UNPARALLEL innovation Lda, and Castalia Solution
#
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
######################################################################

FROM mongo:3.4

# Get download dump archives
ADD http://ci3.castalia.camp/dl/scava.20180808.gz /home
ADD http://ci3.castalia.camp/dl/user.20180808.gz /home
ADD http://ci3.castalia.camp/dl/mqtt-client.20180808.gz /home
ADD http://ci3.castalia.camp/dl/mqttclient.20180808.gz /home
ADD http://ci3.castalia.camp/dl/json-simple.20180808.gz /home
ADD http://ci3.castalia.camp/dl/jsonsimple.20180808.gz /home

WORKDIR home




# Copy copy script used to load dabase dump
COPY mongo-restore.sh /home/mongo-restore.sh
RUN chmod 777 /home/mongo-restore.sh

CMD ["/bin/sh", "/home/mongo-restore.sh"]
