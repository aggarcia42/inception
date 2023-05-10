FROM debian:buster

RUN mkdir -p /run/php
# Update package repositories and install necessary packages
# Install PHP and extensions
RUN apt-get update && apt-get install -y wget curl nano gnupg2 php7.3 php-mysqli php-fpm php-mbstring php-json


# Install and configure WordPress
COPY /conf/www.conf /etc/php/7.3/fpm/pool.d

RUN https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /var/www/html/wordpress
RUN cd var/www/html/wordpress
RUN wp core download --allow-root
RUN wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=mariadb --allow-root
RUN wp core install --url=$DOMAIN_NAME --title=Inception --admin_user=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_DB_PASSWORD --admin_email=test@test.com --allow-root
RUN wp theme install inspiro --activate --allow-root

# Start PHP-FPM
CMD ["/usr/sbin/php-fpm7.3","--nodaemonize"]

