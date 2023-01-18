FROM alpine:latest
RUN apk update && apk add php8-fpm php8-mysqli php8-mbstring php8-json

RUN mkdir /var/www/wordpress

WORKDIR /var/www/wordpress

RUN wget https://wordpress.org/latest.tar.gz && tar -zxvf latest.tar.gz && rm latest.tar.gz

COPY ./conf/wp-config.php /var/www/wordpress/wordpress/wp-config.php

RUN chown -R nobody:nobody /var/www/wordpress

EXPOSE 9000

CMD ["php7-fpm7", "F"]
