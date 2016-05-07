#!/usr/bin/env bash
sudo add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:ondrej/apache2

sudo apt-get update
sudo apt-get upgrade -y

# Force a blank root password for mysql
echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections

# Install Apache and php
sudo apt-get install -y -f apache2
sudo apt-get install -y -f php7.0 libapache2-mod-php7.0

# Install mysql
sudo apt-get install -y -f mysql-server 

# Install commonly used php packages
sudo apt-get install -y -f php7.0-mysql php7.0-curl php7.0-gd php-pear php7.0-mcrypt php7.0-tidy php7.0-xmlrpc php7.0-xsl php7.0-xml php7.0-mbstring

# Change virtual host directory.
sudo sed -i 's/IncludeOptional sites-enabled\/\*\.conf/IncludeOptional vagrant-sites\/\*\.conf/g' /etc/apache2/apache2.conf
