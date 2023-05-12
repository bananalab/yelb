#!/bin/bash -uex

# Massimo Re Ferre' massimo@it20.info

yum -y install postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs
service postgresql initdb
cp "${SCRIPT_DIR}/postgresql.conf" /var/lib/pgsql/data/postgresql.conf
systemctl enable postgresql
systemctl start postgresql
psql -v ON_ERROR_STOP=1 --username postgres -f "${SCRIPT_DIR}/schema.sql"