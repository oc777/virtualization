#!/bin/bash

#create new app
echo "create hours app"
cd /vagrant

git clone https://github.com/DefactoSoftware/Hours.git
cd Hours

#Bundle all the gems
#echo "Bundle all the gems"
#bundle install

echo "run setup"
./bin/setup

echo "db migrate"
#rails db:migrate
rake db:migrate

echo "foreman start"
foreman start

#starting server
echo "starting server"
#rails s #-b 0.0.0.0 -p 3000
