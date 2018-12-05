# API Gateway only requires a JVM to run
FROM openjdk:8-jre-alpine

LABEL description="Image with the API Gateway"

# Downloads last jar build  by the continuous integration server
RUN wget http://ci5.castalia.camp:8080/job/scava-api-gateway/job/dev/lastSuccessfulBuild/artifact/api-gateway/org.eclipse.scava.apigateway/target/scava-api-gateway-1.0.0.jar

COPY application.properties application.properties

# Run jar
ENTRYPOINT ["java","-jar","scava-api-gateway-1.0.0.jar"]
