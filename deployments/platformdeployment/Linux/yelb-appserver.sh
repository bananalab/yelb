#!/bin/bash -uex

export SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

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
cp -r "${SCRIPT_DIR}/../../../yelb-appserver" /home/yelb
chown -R yelb:yelb /home/yelb

cp "${SCRIPT_DIR}/yelb-appserver.service" /lib/systemd/system/yelb-appserver.service
systemctl enable yelb-appserver
systemctl restart yelb-appserver
