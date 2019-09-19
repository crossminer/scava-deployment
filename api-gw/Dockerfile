# API Gateway only requires a JVM to run
FROM openjdk:8-jre-alpine

LABEL description="Image with the API Gateway"

ARG BRANCH=dev

RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*

# Downloads last jar build  by the continuous integration server
RUN wget http://ci5.castalia.camp:8080/job/scava-api-gateway/job/$BRANCH/lastSuccessfulBuild/artifact/api-gateway/org.eclipse.scava.apigateway/target/scava-api-gateway-1.0.0.jar \
&& echo "$BRANCH-$(curl -s http://ci5.castalia.camp:8080/job/scava-api-gateway/job/$BRANCH/lastSuccessfulBuild/consoleText | sed '3q;d' | awk '{ print $NF}')" > /version


COPY application.properties application.properties

# Run jar
ENTRYPOINT ["java","-jar","scava-api-gateway-1.0.0.jar"]
