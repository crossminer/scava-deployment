# Authentication Server only requires a JVM to run
FROM openjdk:8-jre-alpine

LABEL description="Image with the Authentication Server"

RUN apk add --no-cache bash

# Downloads last jar build  by the continuous integration server
RUN wget http://ci3.castalia.camp/dl/scava-auth-service-1.0.0.jar


COPY application.properties application.properties

COPY wait-for-it.sh wait-for-it.sh

RUN chmod +x wait-for-it.sh

# Run jar
ENTRYPOINT ["java","-jar","scava-auth-service-1.0.0.jar"]
