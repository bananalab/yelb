#!/bin/bash -uex
npm install -g @angular/cli@6.0.0
npm install node-sass@4.13.1 --legacy-peer-deps

git clone https://github.com/vmware/clarity-seed.git
cd clarity-seed
git checkout -b f3250ee26ceb847f61bb167a90dc957edf6e7f43

cp ../clarity-seed-newfiles/src/index.html src/index.html
cp ../clarity-seed-newfiles/src/styles.css src/styles.css
cp ../clarity-seed-newfiles/src/env.js src/env.js
cp ../clarity-seed-newfiles/src/app/app* src/app
cp ../clarity-seed-newfiles/src/app/env* src/app
cp ../clarity-seed-newfiles/src/environments/env* src/environments
cp ../clarity-seed-newfiles/package.json package.json
cp ../clarity-seed-newfiles/angular-cli.json .angular-cli.json
rm -r src/app/home
rm -r src/app/about

cd src

npm install  

ng build --environment=prod --output-path=./prod/dist/ -aot -vc -cc -dop --buildOptimizer
ng build --environment=test --output-path=./test/dist/
ng build --environment=dev --output-path=./dev/dist/
