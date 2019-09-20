# scava-deployment
This repository contains the Docker configuration files for the deployment of Scava platform

You should follow the following steps to run this setup:

1. Configure the Environment variable `API_GATEWAY_VAR` under the `web-admin` service with the http://<your_hostname>:<gateway_api_public_port>
1. (Re)Build the docker images using: `docker-compose build --no-cache --parallel`
1. Run the crossminer plaftorm using: `docker-compose up`. Please notice that for this setup we are using an empty mongodb database for oss-db
1. Access to the administration web app by using the following address in the web browser: http://admin-webapp/

For this address to work the first step is mandatory. We need it in order for the oss-app to know the address of the admin-webapp. If instead we use something like ‘localhost’, the oss-app will also use this hostname and the information will not reach the administration webbapp.

Access the interface using http://admin-webapp:80

For login use user: admin  pass: admin

# Issues

## Elasticsearch

If `elasticsearch` fails to start with the following error:

```
elasticsearch_1_a57db85da40a | ERROR: [1] bootstrap checks failed
elasticsearch_1_a57db85da40a | [1]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
```

Make sure to increase your local max virtual memory areas count: `sudo sysctl -w vm.max_map_count=262144`

## Docker-compose

In case you want to make sure to start from a fresh installation, consider to execute:
```
docker system prune -a --volumes
```

## Task analysis

The deployment of all CROSSMINER services listed in the docker-compose may drain out your machine/server resources. The
guidelines below can help you to get your task analysis done.

- Limit the number of services in docker-compose
- Limit the number of metrics
- Limit the time interval of the analysis
- (Optional) Don't queue task analysis, once a task has finished, add a new one

In case the task analysis stops, consider to follow the steps below:
  - docker-compose stop
  - docker-compose up
  - stop the task execution
  - start the task execution

If the steps above don't solve the issue, you can try to:
  - delete task analysis
  - docker-compose stop
  - docker-compose up
  - recreate the task analysis
  - start the task execution
