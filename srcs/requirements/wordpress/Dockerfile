FROM debian:buster

# Update package repositories and install necessary packages
RUN apt-get update && apt-get install -y wget curl nano gnupg2

# Install PHP and extensions
RUN apt-get install -y php-fpm php-mysql php-mbstring php-json

# Install and configure WordPress
RUN wget https://wordpress.org/latest.tar.gz -O /tmp/latest.tar.gz
RUN tar -xvf /tmp/latest.tar.gz -C /var/www/
RUN rm -f /tmp/latest.tar.gz
RUN mv /var/www/wordpress /var/www/html
COPY conf/wp-config.php /var/www/html/wp-config.php
RUN chown -R www-data:www-data /var/www/html

# Expose PHP-FPM port
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
