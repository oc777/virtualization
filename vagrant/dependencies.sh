#!/bin/bash

#https://gorails.com/setup/ubuntu/14.04

#ruby_v=$(cat ./ruby-v.txt)
ruby_v=2.3.1
echo "install dependencies"

#install some dependencies for Ruby
echo "do apt-get update"
sudo apt-get update > /dev/null 2>&1
#sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev > /dev/null 2>&1


echo "installing git..."
sudo apt-get -y install git-all

#For a progress bar when downloading RVM / Rubies:
#echo progress-bar >> ~/.curlrc

#Install RVM:
echo "install rvm"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 # > /dev/null 2>&1


curl -sSL https://get.rvm.io | bash -s stable #> /dev/null 2>&1

#load RVM
source ~/.rvm/scripts/rvm


#install ruby
echo "install ruby"
rvm install $ruby_v #> /dev/null 2>&1

rvm use $ruby_v --default #> /dev/null 2>&1


#install bundler & rails
#gem install bundler rails

#install Bundler
echo "install bundler"
gem install bundler --no-ri --no-rdoc #> /dev/null 2>&1


echo "install nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash


#install NodeJS
echo "installing NodeJS..."
nvm install node
nvm use node
#curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - #> /dev/null 2>&1
#sudo apt-get install -y nodejs #> /dev/null 2>&1

#echo "installing npm..."
#sudo apt-get install -y npm #> /dev/null 2>&1

#install rails
echo "install rails"
gem install rails -v 4.2.6 --no-ri --no-rdoc #> /dev/null 2>&1


#instal PostgreSQL
echo "install PostgreSQL"
sudo apt-get -y install postgresql postgresql-contrib

#install Qt
echo "install Qt"
sudo apt-get -y install libqt4-dev libqtwebkit-dev

#memcached
#apt-get -y install php5-memcache memcached


echo "all installed"
#touch /etc/dependencies-done

