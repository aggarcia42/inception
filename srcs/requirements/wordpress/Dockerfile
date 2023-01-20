FROM debian:buster

# Update package repositories and install necessary packages
# Install PHP and extensions
RUN apt-get update && apt-get install -y wget curl nano gnupg2 php-fpm php-mysql php-mbstring php-json

# Install and configure WordPress
ENV PATH /usr/sbin:$PATH
RUN wget https://wordpress.org/latest.tar.gz -O /tmp/latest.tar.gz
RUN mkdir -p /var/www/html
RUN tar -xvf /tmp/latest.tar.gz -C /var/www/html
RUN rm -f /tmp/latest.tar.gz
COPY conf/wp-config.php /var/www/html/wp-config.php
RUN chown -R www-data:www-data /var/www/html

# Expose PHP-FPM port
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm","-F"]
