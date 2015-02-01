#!/usr/bin/env bash

echo "Installing MariaDB..."

yum -y install mariadb-server mariadb expect

// Change after installation
MYSQL_ROOT_PASSWORD=vagrant

MORESECURE_MYSQL=$(expect -c "

set timeout 10
spawn mysql_secure_installation

expect \"Enter current password for root (enter for none):\"
send \"$MYSQL\r\"

expect \"Change the root password?\"
send \"n\r\"

expect \"Remove anonymous users?\"
send \"y\r\"

expect \"Disallow root login remotely?\"
send \"y\r\"

expect \"Remove test database and access to it?\"
send \"y\r\"

expect \"Reload privilege tables now?\"
send \"y\r\"

expect eof
")

echo "$MORESECURE_MYSQL"

rpm -e -y expect

systemctl enable mariadb
systemctl start mariadb

echo "Done!"

