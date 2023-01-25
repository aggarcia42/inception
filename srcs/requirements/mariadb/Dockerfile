FROM debian:buster

RUN apt-get update && apt-get install mariadb-server -y

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/my.cnf

COPY  ./conf/init.sql /docker-entrypoint-initdb.d/init.sql

RUN chown -R mysql:mysql  /var/lib/mysql

EXPOSE 3306

RUN service mysql start && mysql < /docker-entrypoint-initdb.d/init.sql

CMD ["mysqld"]