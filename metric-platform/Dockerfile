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

# install python 3 and ruby and puppet-lint
RUN apt-get update \
&&  apt-get install -y python3 \
    ruby \
&& apt-get clean \
&& rm -r /var/lib/apt/lists/*  \
&&  gem install puppet-lint


# Download and  deploy Puppeteer
ADD https://github.com/blueoly/CrossPuppeteer/archive/master.zip /
RUN  unzip master.zip \
&&  rm master.zip


WORKDIR /ossmeter

RUN wget http://ci3.castalia.camp/dl/scava-product-linux.gtk.x86_64-smells.zip \
&& unzip scava-product-linux.gtk.x86_64-smells.zip \
&& rm scava-product-linux.gtk.x86_64-smells.zip

# Get the binaries and uncompress them in the container
# RUN wget http://ci5.castalia.camp:8080/job/scava-metricplatform/lastSuccessfulBuild/artifact/metric-platform/releng/org.eclipse.scava.product/target/products/scava-product-linux.gtk.x86_64.zip \
# && unzip scava-product-linux.gtk.x86_64.zip \
# && rm scava-product-linux.gtk.x86_64.zip

COPY prop.properties /ossmeter/prop.properties

WORKDIR plugins

COPY META-INF META-INF

# find all jars of Systems Configuration Metric Providers and update the properties file
RUN find . -type f -name 'org.eclipse.scava.metricprovider.trans.configuration.*' -exec jar -uf '{}' META-INF/puppeteer.properties \;

RUN rm -rf META-INF

WORKDIR /ossmeter

# By default, starts the platform to run the master, a slave, and the web API
ENTRYPOINT exec ./eclipse -apiServer -master -slave -ossmeterConfig prop.properties
