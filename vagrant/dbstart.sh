#!/bin/sh -e

echo "POSTGRES SET UP"

# SOURCE: https://wiki.postgresql.org/wiki/PostgreSQL_For_Development_With_Vagrant#Linux_Installation_2
# SOURCE: https://github.com/jackdb/pg-app-dev-vm/blob/master/Vagrant-setup/bootstrap.sh

# Edit the following to change the name of the database user that will be created:
APP_DB_USER=vagrant
APP_DB_PASS=dbpass

# Edit the following to change the version of PostgreSQL that is installed
PG_VERSION=9.4

###########################################################
# Changes below this line are probably not necessary
###########################################################

echo "export debian..."
export DEBIAN_FRONTEND=noninteractive

echo "provisioned-on=...."

PROVISIONED_ON=/etc/vm_provision_on_timestamp

echo "if statement..."
if [ -f "$PROVISIONED_ON" ]
then
  echo "VM was already provisioned at: $(cat $PROVISIONED_ON)"
  echo "To run system updates manually login via 'vagrant ssh' and run 'apt-get update && apt-get upgrade'"
  echo ""
  exit
fi


echo "PG_REPO_APT_SOURCE..."
PG_REPO_APT_SOURCE=/etc/apt/sources.list.d/pgdg.list

echo "if statement..."
if [ ! -f "$PG_REPO_APT_SOURCE" ]
then
  # Add PG apt repo:
  echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > "$PG_REPO_APT_SOURCE"

  # Add PGDG repo key:
  wget --quiet -O - https://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
fi

# Update package list and upgrade all packages
apt-get update
apt-get -y upgrade

apt-get -y install "postgresql-$PG_VERSION" "postgresql-contrib-$PG_VERSION"

PG_CONF="/etc/postgresql/$PG_VERSION/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PG_VERSION/main/pg_hba.conf"
PG_DIR="/var/lib/postgresql/$PG_VERSION/main"

# Edit postgresql.conf to change listen address to '*':
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"

# Append to pg_hba.conf to add password auth:
echo "host    all             all             all                     md5" >> "$PG_HBA"

# Explicitly set default client_encoding
echo "client_encoding = utf8" >> "$PG_CONF"

# Restart so that all new config is loaded:
service postgresql restart

cat << EOF | su - postgres -c psql
-- Create the database user:
CREATE USER $APP_DB_USER WITH PASSWORD '$APP_DB_PASS';

-- Create the database:
CREATE DATABASE $APP_DB_NAME WITH OWNER=$APP_DB_USER
                                  LC_COLLATE='en_US.utf8'
                                  LC_CTYPE='en_US.utf8'
                                  ENCODING='UTF8'
                                  TEMPLATE=template0;
CREATE ROLE $APP_DB_USER SUPERUSER LOGIN;

EOF

# Tag the provision time:
date > "$PROVISIONED_ON"

echo "Successfully created PostgreSQL dev virtual machine."
echo ""

