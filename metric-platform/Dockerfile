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
# Notes:
#
# Running the OSSMETER platform requires a image with Java JDK installed. Moreover, Eclipse
# requires the glibc to run, which excludes alpine-based small images since they use musl,
# not 100% compatible with glibc.
#

FROM openjdk:8-jdk
LABEL description="Image with the OSSMETER platform"

ARG BRANCH=dev

# install python 3 and ruby and puppet-lint and maven
RUN apt-get update \
&&  apt-get install -y python3 \
    ruby \
	maven \
&& apt-get clean \
&& rm -r /var/lib/apt/lists/*  \
&&  gem install puppet-lint


# Download and  deploy Puppeteer
# ADD https://github.com/blueoly/CrossPuppeteer/archive/master.zip /
RUN svn export https://github.com/crossminer/scava/branches/$BRANCH/crossPuppeteer
# RUN  unzip master.zip \
# &&  rm master.zip


WORKDIR /ossmeter

# Get the binaries and uncompress them in the container
RUN wget http://ci5.castalia.camp:8080/job/scava-metric-platform/job/$BRANCH/lastSuccessfulBuild/artifact/metric-platform/releng/org.eclipse.scava.product/target/products/scava-product-linux.gtk.x86_64.zip \
&& unzip scava-product-linux.gtk.x86_64.zip \
&& rm scava-product-linux.gtk.x86_64.zip \
&& echo "$BRANCH-$(curl -s http://ci5.castalia.camp:8080/job/scava-metric-platform/job/$BRANCH/lastSuccessfulBuild/consoleText | sed '3q;d' | awk '{ print $NF}')" > /version

COPY prop.properties /ossmeter/prop.properties
COPY wait-for-it.sh /ossmeter/wait-for-it.sh

WORKDIR plugins

COPY META-INF META-INF

# find all jars of Systems Configuration Metric Providers and update the properties file
RUN find . -type f -name 'org.eclipse.scava.metricprovider.trans.configuration.*' -exec jar -uf '{}' META-INF/puppeteer.properties \;

RUN rm -rf META-INF

WORKDIR ..

RUN echo "-Dcom.sun.management.jmxremote.rmi.port=8192\n-Dcom.sun.management.jmxremote=true\n-Dcom.sun.management.jmxremote.port=8192\n-Dcom.sun.management.jmxremote.ssl=false\n-Dcom.sun.management.jmxremote.authenticate=false\n-Dcom.sun.management.jmxremote.local.only=false\n-Djava.rmi.server.hostname=localhost" >> ./eclipse.ini

# By default, starts the platform to run the master, a slave, and the web API
ENTRYPOINT exec ./eclipse -apiServer -master -slave -config prop.properties
