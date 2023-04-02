CREATE DATABASE IF NOT EXISTS $WORPRESS_DB_NAME;
CREATE USER IF NOT EXISTS '$WORPRESS_DB_USER'@'%' IDENTIFIED BY '$WORPRESS_DB_PASSWORD';
GRANT ALL PRIVILEGES ON $WORPRESS_DB_NAME.* TO '$WORPRESS_DB_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '54321';
FLUSH PRIVILEGES;