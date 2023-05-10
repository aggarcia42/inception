FROM debian:buster

RUN mkdir -p /run/php
# Update package repositories and install necessary packages
# Install PHP and extensions
RUN apt-get update && apt-get install -y wget curl nano gnupg2 php7.3 php-mysqli php-fpm php-mbstring php-json


# Install and configure WordPress
COPY /conf/www.conf /etc/php/7.3/fpm/pool.d

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN /bin/bash -c '\
    if [ ! -d "/var/www/html/wordpress" ]; then \
        mkdir /var/www/html/wordpress && \
        cd var/www/html/wordpress && \
        wp core download --allow-root && \
        wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=mariadb --allow-root && \
        wp core install --url=$DOMAIN_NAME --title=Inception --admin_user=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_DB_PASSWORD --admin_email=test@test.com --allow-root \
        wp theme install inspiro --activate --allow-root; \
    fi && \
    exec php-fpm7.3 --nodaemonize'
