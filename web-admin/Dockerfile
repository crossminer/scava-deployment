FROM nginx:1.14-alpine
LABEL description="Image with CROSSMINER Adminstration Web Interface"

ENV API_GATEWAY_VAR=http://localhost:8086

WORKDIR /usr/share/nginx/html

ADD default.conf /etc/nginx/conf.d/

RUN wget http://ci3.castalia.camp/dl/admin-webapp.zip \
&& unzip -o admin-webapp.zip \
&& rm admin-webapp.zip

## startup.sh script is launched at container run
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

CMD ["/bin/sh", "/startup.sh"]
