# OSSMETER webapp only requires the JRE to run
FROM openjdk:8-jdk-alpine

LABEL description="Image with the Knowledge base image"

# File with Docker specific configurions
COPY application.properties application.properties

# Downloads last jar build  by the continuous integration server
RUN wget http://ci5.castalia.camp:8080/job/scava-knowledgebase/lastSuccessfulBuild/artifact/knowledge-base/org.eclipse.scava.knowledgebase/target/scava.knoledgebase.jar

# Update the jar file with the Docker specific configurions
RUN jar -uf scava.knoledgebase.jar application.properties

# Run jar
ENTRYPOINT ["java","-jar","scava.knoledgebase.jar"]
