#!/bin/bash -uex
export SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${SCRIPT_DIR}"
./redis-server.sh
./yelb-db.sh
./yelb-appserver.sh
./yelb-ui.sh
