#!/bin/bash

# Massimo Re Ferre' massimo@it20.info

yum -y install postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs
service postgresql initdb
cp "${BASH_SOURCE[0]}/postgresql.conf" /var/lib/pgsql/data/postgresql.confsystemctl enable postgresql
systemctl start postgresql
psql -v ON_ERROR_STOP=1 --username postgres -f "${BASH_SOURCE[0]}/schema.sql"