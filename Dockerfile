FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl build-essential php-dev libphp-embed \
    && curl -O http://nginx.org/keys/nginx_signing.key \
    && apt-key add nginx_signing.key \
    && echo "deb http://nginx.org/packages/mainline/ubuntu/ xenial nginx" >> /etc/apt/sources.list \
    && echo "deb-src http://nginx.org/packages/mainline/ubuntu/ xenial nginx" >> /etc/apt/sources.list \
    && apt-get update && apt-get install -y unit
ADD server.json /conf/server.json
ADD apps /var/www/apps

WORKDIR /var/www

EXPOSE 80

CMD ["/usr/sbin/unitd", "--no-daemon"]
