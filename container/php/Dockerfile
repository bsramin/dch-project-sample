FROM feries/php7.1:latest
MAINTAINER Ramin Banihashemi <a@ramin.it>

ENV DEBIAN_FRONTEND noninteractive

COPY ./xdebug-starter.sh /usr/local/bin/xdebug-starter
RUN chmod +x /usr/local/bin/xdebug-starter
RUN /usr/local/bin/xdebug-starter