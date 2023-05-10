FROM debian:buster

RUN mkdir -p /run/php
# Update package repositories and install necessary packages
# Install PHP and extensions
RUN apt-get update && apt-get install -y wget php7.3 php7.3-mysqli php7.3-fpm mariadb-client

# Install and configure WordPress
COPY /conf/www.conf /etc/php/7.3/fpm/pool.d
COPY /conf/wp-config.sh .

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN chmod 777 wp-config.sh

CMD ["./wp-config.sh"]