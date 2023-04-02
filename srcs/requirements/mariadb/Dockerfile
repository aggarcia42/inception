FROM debian:buster

RUN apt-get update && apt-get install mariadb-server -y

RUN mkdir -p $HOME/data/mariadb

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/
COPY  ./tools /var/www/

EXPOSE 3306

RUN service mysql start && mysql << /var/www/init.sql;

CMD ["mysqld"]