FROM debian:buster

RUN apt-get update && apt-get install mariadb-server -y

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN echo "CREATE DATABASE IF NOT EXISTS "$MYSQL_DATABASE";" >> init.sql
RUN echo "CREATE USER IF NOT EXISTS "$MYSQL_USER" IDENTIFIED BY "$MYSQL_PASSWORD";" >> init.sql
RUN echo "GRANT ALL PRIVILEGES ON *.* TO "$MYSQL_USER" IDENTIFIED BY "$MYSQL_PASSWORD";" >> init.sql
RUN echo "ALTER USER 'root'@'localhost' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD";" >> init.sql


RUN service mysql start && mysql < init.sql;

CMD ["mysqld"]