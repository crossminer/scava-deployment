######################################################################
# Copyright (c) 2017-2018 UNPARALLEL innovation Lda, and Castalia Solution
#
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
######################################################################

#
# Note:
#
# OSSMETER webapp only requires the JRE to run so we use alpine-based base.
#

FROM openjdk:8-jre-alpine
LABEL description="Image with the OSSMETER web application. Exposes port 9000"

# Start script needs bash shell, uncompress needs unzip
RUN apk add --no-cache bash unzip

RUN wget http://ci3.castalia.camp/dl/org-ossmeter-webapp-1.0-SNAPSHOT.zip \
	&& unzip /org-ossmeter-webapp-1.0-SNAPSHOT.zip \
	&& rm /org-ossmeter-webapp-1.0-SNAPSHOT.zip

WORKDIR /org-ossmeter-webapp-1.0-SNAPSHOT/bin

EXPOSE 9000
ENTRYPOINT ["bash", "org-ossmeter-webapp"]
