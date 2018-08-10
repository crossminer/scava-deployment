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

WORKDIR ossmeter

# Get the binaries and uncompress them in the container
RUN wget http://ci5.castalia.camp:8080/job/scava-metricplatform/lastSuccessfulBuild/artifact/metric-platform/releng/org.eclipse.scava.product/target/products/scava-product-linux.gtk.x86_64.zip \
&& unzip scava-product-linux.gtk.x86_64.zip \
&& rm scava-product-linux.gtk.x86_64.zip

COPY prop.properties /ossmeter/prop.properties

# By default, starts the platform to run the master, a slave, and the web API
ENTRYPOINT exec ./eclipse -apiServer -master -slave -ossmeterConfig prop.properties
