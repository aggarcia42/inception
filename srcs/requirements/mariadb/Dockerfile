FROM debian:buster

RUN apt-get update && apt-get install mariadb-server -y

COPY ./conf/my.cnf /etc/mysql/my.cnf

COPY  ./conf/init.sql /var/www

RUN service mysql start && mysql << /var/www/init.sql

EXPOSE 3306

CMD ["mysqld"]