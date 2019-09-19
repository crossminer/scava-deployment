ARG BRANCH=dev

FROM node:8-slim AS builder
ARG BRANCH
RUN apt-get update \
&&  apt-get install -y git \
subversion

## records the branch and commit version associated to the software
RUN echo "$BRANCH-$(git ls-remote https://github.com/crossminer/scava.git $BRANCH | awk '{ print $1}')" > version \
&&  svn export https://github.com/crossminer/scava/branches/$BRANCH/administration/scava-administration/ \
&&  cd scava-administration \
&&  npm update \
&&  npm install \
&&  npm install -g @angular/cli@7.3.9 \
&&  npm install --save-dev @angular-devkit/build-angular \
&&  ng build --prod

FROM nginx:1.14-alpine
LABEL description="Image with CROSSMINER Adminstration Web Interface"

ENV API_GATEWAY_VAR=http://localhost:8086

WORKDIR /usr/share/nginx/html

COPY default.conf /etc/nginx/conf.d/

COPY --from=builder /scava-administration/dist .
COPY --from=builder /version /version

## startup.sh script is launched at container run
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

CMD ["/bin/sh", "/startup.sh"]
