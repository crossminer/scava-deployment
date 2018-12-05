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
ADD http://ci3.castalia.camp/dl/M24/JDBM.2018.11.16.gz /home
ADD http://ci3.castalia.camp/dl/M24/JDBM3.2018.11.16.gz /home
ADD http://ci3.castalia.camp/dl/M24/Jest.2018.11.16.gz /home
ADD http://ci3.castalia.camp/dl/M24/SVNKIT.2018.11.16.gz /home
ADD http://ci3.castalia.camp/dl/M24/elasticsearch-java-client.2018.11.16.gz /home
ADD http://ci3.castalia.camp/dl/M24/elasticsearchjava.2018.11.16.gz /home
ADD http://ci3.castalia.camp/dl/M24/elasticsearchjavaclient.2018.11.16.gz /home
ADD http://ci3.castalia.camp/dl/M24/emf.2018.11.16.gz /home
ADD http://ci3.castalia.camp/dl/M24/gef.2018.11.16.gz /home
ADD http://ci3.castalia.camp/dl/M24/netty.2018.11.16.gz /home
ADD http://ci3.castalia.camp/dl/M24/scava-analysis.2018.11.16.gz /home
ADD http://ci3.castalia.camp/dl/M24/scava.2018.11.16.gz /home
ADD http://ci3.castalia.camp/dl/M24/spring-elasticsearch.2018.11.16.gz /home
ADD http://ci3.castalia.camp/dl/M24/springelasticsearch.2018.11.16.gz /home


WORKDIR home




# Copy copy script used to load dabase dump
COPY mongo-restore.sh /home/mongo-restore.sh
RUN chmod 777 /home/mongo-restore.sh

CMD ["/bin/bash", "/home/mongo-restore.sh"]
