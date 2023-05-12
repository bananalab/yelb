#!/bin/bash -uex

# Massimo Re Ferre' massimo@it20.info
export SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
###########################################################
###########              USER INPUTS            ###########
###########################################################
# Variables AppServer component 
export RACK_ENV="${RACK_ENV:-custom}"
export REDIS_SERVER_ENDPOINT="${REDIS_SERVER_ENDPOINT:-localhost}"
export YELB_DB_SERVER_ENDPOINT="${YELB_DB_SERVER_ENDPOINT:-localhost}"
# If you want to connect to DDB you need to:
# set $YELB_DDB_RESTAURANTS / $YELB_DDB_CACHE / $AWS_REGION instead of $YELB_DB_SERVER_ENDPOINT / $REDIS_SERVER_ENDPOINT

yum update -y
amazon-linux-extras install epel -y
amazon-linux-extras install ruby2.6 -y
yum install -y postgresql
yum install -y ruby-devel
yum install -y gcc
yum install -y postgresql-devel
gem install pg -v 1.2.2 --no-document
gem install redis --no-document
gem install sinatra --no-document
gem install aws-sdk-dynamodb --no-document
if [ ! -d /home/yelb ]; then
    useradd yelb
fi
rm -rf /home/yelb/yelb-appserver
cp -r $(git rev-parse --show-toplevel)/yelb-appserver /home/yelb
chown -R yelb:yelb /home/yelb

cp "${SCRIPT_DIR}/yelb-appserver.service" /lib/systemd/system/yelb-appserver.service
systemctl enable yelb-appserver
systemctl start yelb-appserver
