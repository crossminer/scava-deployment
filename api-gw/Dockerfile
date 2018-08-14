# API Gateway only requires a JVM to run
FROM openjdk:8-jre-alpine

LABEL description="Image with the Authentication Server"

# Downloads last jar build  by the continuous integration server
RUN wget http://ci3.castalia.camp/dl/scava-api-gateway-1.0.0.jar
# COPY scava-api-gateway-1.0.0.jar scava-api-gateway-1.0.0.jar
COPY application.properties application.properties

# Run jar
ENTRYPOINT ["java","-jar","scava-api-gateway-1.0.0.jar"]
