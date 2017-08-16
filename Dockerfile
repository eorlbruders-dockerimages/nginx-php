FROM registry.eorlbruder.de/nginx
MAINTAINER  David Magnus Henriques <eorlbruder@magnus-henriques.de>

RUN pacman -Syyu --noconfirm --quiet --needed php php-fpm php-gd php-intl\
      php-mcrypt php-ldap php-sqlite php-pgsql php-tidy && \
    pacman -Sc --noconfirm

ADD assets/ /

RUN bash setup-nginx-php

CMD ["supervisord", "-n"]
