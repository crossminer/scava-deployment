
FROM nginx:1.14-alpine
LABEL description="Image with CROSSMINER Adminstration Web Interface"

WORKDIR /usr/share/nginx/html


ADD default.conf /etc/nginx/conf.d/


RUN wget http://ci3.castalia.camp/dl/admin-webapp-1.1.zip \
&& unzip -o admin-webapp-1.1.zip \
&& rm admin-webapp-1.1.zip

EXPOSE 80
