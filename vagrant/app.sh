#!/bin/bash

#create new app
echo "create hours app"
cd /vagrant

git clone https://github.com/DefactoSoftware/Hours.git
cd Hours

echo "run setup"
./bin/setup

#increase timeout
echo "increasing timeout..."
sed -i "s/5/120/" config/unicorn.rb

#switch to Single Tenant
echo "switch to Single Tenant"
sed -i "s/SINGLE_TENANT_MODE=false/SINGLE_TENANT_MODE=true/g" .env


#create user
echo "now we’ll create a user"
cp ../create_testuser.rake lib/tasks

./bin/rake create_testuser


echo "foreman start"
#echo "port: 7000" > .foreman
foreman start

