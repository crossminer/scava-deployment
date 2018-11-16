
FROM nginx:1.14-alpine
LABEL description="Image with CROSSMINER Adminstration Web Interface"

WORKDIR /usr/share/nginx/html

ADD /nginx/default.conf /etc/nginx/conf.d/

RUN wget http://ci3.castalia.camp/dl/admin-webapp.zip \
&& unzip -o admin-webapp.zip \
&& rm admin-webapp.zip

ADD /angular/externalConfig.json /usr/share/nginx/html/assets/config/

EXPOSE 80
