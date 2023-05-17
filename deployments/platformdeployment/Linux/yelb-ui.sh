#!/bin/bash -uex
export SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export YELB_APPSERVER_ENDPOINT=$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)

amazon-linux-extras install epel -y
yum install -y nginx

cp "${SCRIPT_DIR}/nginx.conf" /etc/nginx/nginx.conf
cat "${SCRIPT_DIR}/nginx_default.conf" | sed "s/localhost/${YELB_APPSERVER_ENDPOINT}/g" > /etc/nginx/conf.d/default.conf
cp -r "${SCRIPT_DIR}/../../../yelb-ui/clarity-seed/src/prod/dist" /usr/share/nginx/yelb

chkconfig nginx on
service nginx start
