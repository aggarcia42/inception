#!/bin/bash

if [ ! -d "/var/www/html/wordpress" ]; then \
        mkdir -p /var/www/html/wordpress
        cd var/www/html/wordpress
        wp core download --allow-root
        wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
        wp core install --url=$DOMAIN_NAME --title=Inception --admin_user=$MYSQL_USER --admin_password=$MYSQL_PASSWORD --admin_email=test@test.com --allow-root
        wp theme install inspiro --activate --allow-root
fi
exec php-fpm7.3 --nodaemonize