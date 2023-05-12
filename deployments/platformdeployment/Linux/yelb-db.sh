#!/bin/bash -uex

# Massimo Re Ferre' massimo@it20.info
export SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
yum -y install postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs
postgresql-setup initdb || true
cp "${SCRIPT_DIR}/postgresql.conf" /var/lib/pgsql/data/postgresql.conf
cp "${SCRIPT_DIR}/pg_hba.conf" /var/lib/pgsql/data/pg_hba.conf
systemctl enable postgresql
systemctl start postgresql
psql -v ON_ERROR_STOP=1 --username postgres -f "${SCRIPT_DIR}/schema.sql"