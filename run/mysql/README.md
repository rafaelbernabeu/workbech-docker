Run docker-mysql-run to start the server and wait a few seconds.

Run docker-mysql-logs to get the random generated password.

Run docker-mysql-cli to attach the container and login to mysql console.

Use the following command to change the root password.

ALTER USER 'root'@'localhost' IDENTIFIED BY 'new-password-here';

Then create a user to access from '%' (any ip, 0.0.0.0)

CREATE USER 'root'@'%' IDENTIFIED BY 'new-password-here';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'new-password-here';