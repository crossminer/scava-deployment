
FROM nginx:alpine
LABEL description="Image with CROSSMINER Adminstration Web Interface"

WORKDIR /usr/share/nginx/html

RUN wget http://ci3.castalia.camp/dl/admin-webapp.zip \
&& unzip -o admin-webapp.zip \
&& rm admin-webapp.zip

EXPOSE 80
