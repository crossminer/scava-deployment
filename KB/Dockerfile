# OSSMETER webapp only requires the JRE to run
FROM openjdk:8-jre-alpine

LABEL description="Image with the Knowledge base image"

RUN wget http://ci5.castalia.camp:8080/job/scava-knowledgebase/lastSuccessfulBuild/artifact/knowledge-base/org.eclipse.scava.knowledgebase/target/scava.knoledgebase.jar

ENTRYPOINT ["java","-jar","scava.knoledgebase.jar"]
