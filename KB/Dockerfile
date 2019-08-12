# OSSMETER webapp only requires the JRE to run
FROM openjdk:8-jdk-alpine

LABEL description="Image with the Knowledge base image"

# File with Docker specific configurions

WORKDIR /home/root
COPY application.properties application.properties
COPY src-rascal/ /home/root
# Downloads last jar build  by the continuous integration server
RUN wget http://ci5.castalia.camp:8080/job/scava-knowledge-base/job/dev/lastSuccessfulBuild/artifact/knowledge-base/org.eclipse.scava.knowledgebase/target/scava.knoledgebase.jar
RUN mkdir localM3models
RUN mkdir maven_repo
RUN mkdir deltas
# COPY Indexes.tar.gz /home/root/
ADD  http://ci3.castalia.camp/dl/Indexes.tar.gz /home/root/
RUN tar -xzf /home/root/Indexes.tar.gz
# Update the jar file with the Docker specific configurions
RUN jar -uf scava.knoledgebase.jar application.properties

# Run jar
ENTRYPOINT ["java","-jar","scava.knoledgebase.jar"]
