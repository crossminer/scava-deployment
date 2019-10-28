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

# Get download dump archive
ADD http://ci4.castalia.camp/dl/CROSSMINER.20191028.gz /home 
RUN mv /home/CROSSMINER.20191028.gz /home/CROSSMINER.gz
WORKDIR home


# Copy copy script used to load dabase dump
COPY mongo-restore.sh /home/mongo-restore.sh
RUN chmod 777 /home/mongo-restore.sh

CMD ["/bin/bash", "/home/mongo-restore.sh"]
