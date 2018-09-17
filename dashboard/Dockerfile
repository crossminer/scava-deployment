######################################################################
# Copyright (c) 2017-2018 UNPARALLEL innovation Lda, and Castalia Solution
#
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
######################################################################

FROM python

ENV GRIMOIRELAB_RELEASE "0.1.2"

RUN apt-get update \
&&  apt-get install -y git \
subversion \
build-essential
#gcc \
#musl-dev \
#libffi-dev \
#openssl-dev \
#openblas-dev \
#py3-numpy \
#py3-scipy

# Install GrimoireLab
RUN pip3 install --upgrade pip \
setuptools \
wheel

RUN pip3 install grimoirelab==${GRIMOIRELAB_RELEASE}

# Downloads perceval-scava and scava metrics folders from Github in 'dev' branch
RUN svn export https://github.com/crossminer/scava/branches/dev/web-dashboards/perceval-scava \
&& svn export https://github.com/crossminer/scava/branches/dev/web-dashboards/scava-metrics

# Install perceval-scava
WORKDIR perceval-scava
RUN pip3 install .

WORKDIR ..

COPY importer.sh importer.sh
COPY wait-for-it.sh wait-for-it.sh

RUN chmod +x wait-for-it.sh
RUN chmod +x importer.sh

ENTRYPOINT ["importer.sh"]
