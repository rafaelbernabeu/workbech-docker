Run docker-mysql-run to start the server and wait a few seconds.

Run docker-mysql-logs to get the random generated password.

Run docker-mysql-cli to attach the container and login to mysql console.

Use the following command to change the root password.

ALTER USER 'root'@'localhost' IDENTIFIED BY 'new-password-here';