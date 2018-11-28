# scava-deployment
This repository contains the Docker configuration files for the deployment of Scava platform

You should follow the following steps to run this setup:

1. Edit the hosts of your machine, creating a new record for the IP address: `127.0.0.1` with hostname: `admin-webapp`
1. Edit the `externalConfig.json` file inside `web-admin/angular/` docker image and put inside it the IP address of your host as follow:
   {
    "SERVICE_URL" :"http://HOST-IP:8086"
   }
1. (Re)Build the docker images using: `docker-compose -f docker-compose-build.yml build --no-cache`
1. Run the crossminer plaftorm using: `docker-compose -f docker-compose-build.yml up`. Please notice that for this setup we are using an empty mongodb database for oss-db
1. Access to the administration web app by using the following address in the web browser: http://admin-webapp/

For this address to work the first step is mandatory. We need it in order for the oss-app to know the address of the admin-webapp. If instead we use something like ‘localhost’, the oss-app will also use this hostname and the information will not reach the administration webbapp.

Access the interface using http://admin-webapp:80

For login use user: admin  pass: admin

# Issues

If `elasticsearch` fails to start with the following error:

```
elasticsearch_1_a57db85da40a | ERROR: [1] bootstrap checks failed
elasticsearch_1_a57db85da40a | [1]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
```

Make sure to increase your local max virtual memory areas count: `sudo sysctl -w vm.max_map_count=262144`
