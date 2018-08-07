# OSSMETER webapp only requires the JRE to run
FROM openjdk:8-jre-alpine

LABEL description="Image with the Knowledge base image"

RUN wget http://ci3.castalia.camp/dl/scava.knoledgebase.jar

ENTRYPOINT ["java","-jar","scava.knoledgebase.jar"]
