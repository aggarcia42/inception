FROM debian:buster

# Update package repositories and install necessary packages
# Install PHP and extensions
RUN apt-get update && apt-get install -y wget curl nano gnupg2 php7.3 php-mysqli php-fpm php-mbstring php-json

# Install and configure WordPress
ENV PATH /usr/sbin:$PATH
RUN wget https://wordpress.org/latest.tar.gz -O /tmp/latest.tar.gz
RUN mkdir -p /var/www/html
RUN tar -xvf /tmp/latest.tar.gz -C /var/www/html
RUN rm -f /tmp/latest.tar.gz
RUN mkdir /run/php
COPY conf/wp-config.php /var/www/html/wp-config.php
COPY conf/www.conf /etc/php7.3/php-fpm.d/www.conf
RUN chown -R www-data:www-data /var/www/html

# Expose PHP-FPM port
# EXPOSE 9000

# Start PHP-FPM
CMD ["/usr/sbin/php-fpm7.3","-F"]

