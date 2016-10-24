#!/bin/bash

#https://gorails.com/setup/ubuntu/14.04

ruby_v=2.3.1

echo " "
echo "installing core dependencies..."
sudo apt-get update > /dev/null 2>&1
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev libpq-dev > /dev/null 2>&1

echo " "
echo "installing NodeJS..."
#nvm install node
#nvm use node
#curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - #> /dev/null 2>&1
sudo apt-get install -y nodejs > /dev/null 2>&1

echo " "
echo "installing npm..."
sudo apt-get install -y npm > /dev/null 2>&1

echo " "
echo "installing rvm..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 > /dev/null 2>&1
curl -sSL https://get.rvm.io | bash -s stable > /dev/null 2>&1
#load RVM
source ~/.rvm/scripts/rvm

echo " "
echo "installing ruby..."
rvm install $ruby_v > /dev/null 2>&1
#set as default v
rvm use $ruby_v --default > /dev/null 2>&1

echo " "
echo "installing bundler..."
gem install bundler --no-ri --no-rdoc > /dev/null 2>&1

echo " "
echo "installing rails..."
gem install rails -v 4.2.6 --no-ri --no-rdoc > /dev/null 2>&1


echo " "
echo "installing Qt..."
sudo apt-get -y install libqt4-dev libqtwebkit-dev > /dev/null 2>&1

echo " "
echo "END DEPENDENCIES.SH"
echo "---------------------------------------------------"
echo " "
