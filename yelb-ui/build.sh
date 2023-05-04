#!/bin/bash -uex
npm install -g @angular/cli@6.0.0
npm install node-sass

git clone https://github.com/vmware/clarity-seed.git
cd clarity-seed
git checkout -b f3250ee26ceb847f61bb167a90dc957edf6e7f43

cp ../clarity-seed-newfiles/src/index.html /clarity-seed/src/index.html
cp ../clarity-seed-newfiles/src/styles.css /clarity-seed/src/styles.css
cp ../clarity-seed-newfiles/src/env.js /clarity-seed/src/env.js
cp ../clarity-seed-newfiles/src/app/app* /clarity-seed/src/app
cp ../clarity-seed-newfiles/src/app/env* /clarity-seed/src/app
cp ../clarity-seed-newfiles/src/environments/env* /clarity-seed/src/environments
cp ../clarity-seed-newfiles/package.json /clarity-seed/package.json
cp ../clarity-seed-newfiles/angular-cli.json /clarity-seed/.angular-cli.json
rm -r ../clarity-seed/src/app/home
rm -r ../clarity-seed/src/app/about

cd src

npm install  

ng build --environment=prod --output-path=dist/ -aot -vc -cc -dop --buildOptimizer
