FROM debian:buster

RUN apt update && apt install mariadb mariadb-client

COPY ./conf/my.cnf /etc/mysql/my.cnf

COPY  ./conf/init.sql /docker-entrypoint-initdb.d/init.sql

RUN chown -R mysql:mysql  /var/lib/mysql

EXPOSE 3306

CMD ["mysqld"]