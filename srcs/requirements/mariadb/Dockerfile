FROM debian:buster

RUN apt-get update && apt-get install mariadb-server -y

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/
COPY  ./conf/init.sql /var/www/

EXPOSE 3306

RUN service mysql start && mysql << /var/www/init.sql

CMD ["mysqld"]