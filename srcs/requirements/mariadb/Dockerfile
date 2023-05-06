FROM debian:buster

RUN apt-get update && apt-get install mariadb-server -y

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/
#COPY  ./tools /var/www/

RUN echo "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;" >> /var/www/init.sql
RUN echo "CREATE USER IF NOT EXISTS '${WORDPRESS_DB_USER}' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';" >> /var/www/init.sql
RUN echo "GRANT ALL PRIVILEGES ON *.* TO '${WORDPRESS_DB_USER}' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';" >> /var/www/init.sql
RUN echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '54321';" >> /var/www/init.sql

# EXPOSE 3306

RUN service mysql start && mysql < /var/www/init.sql;

CMD ["mysqld"]