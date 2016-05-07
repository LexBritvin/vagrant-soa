#!/usr/bin/env bash

PMA_DIR="/home/vagrant/phpmyadmin"
PROVISION_INIT="/etc/profile.d/provision_init.lock"
ACTIVEMQ_DIR="/home/vagrant/apache-activemq"


# Install it only once.
if [ ! -f "$PROVISION_INIT" ]; then 
  # Force a root password for mysql.
  echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
  echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections

  # Add repositories.
  sudo add-apt-repository ppa:ondrej/php
  sudo add-apt-repository ppa:ondrej/apache2

  sudo apt-get update
  sudo apt-get upgrade -y

  # Install Apache and php.
  sudo apt-get install -y -f apache2
  sudo apt-get install -y -f php7.0 libapache2-mod-php7.0

  # Install mysql.
  sudo apt-get install -y -f mysql-server 

  # Install commonly used php packages.
  sudo apt-get install -y -f php7.0-mysql php7.0-curl php7.0-gd php-pear php7.0-mcrypt php7.0-tidy php7.0-xmlrpc php7.0-xsl php7.0-xml php7.0-mbstring
  # Clean temp files and set flag to prvent this provisioning again.
  sudo apt-get clean
  touch $PROVISION_INIT
fi

# Check if dir exist or empty and install phpmyadmin.
if [ ! -d "$PMA_DIR" ] || [ ! "$(ls -A $PMA_DIR)" ]; then
  wget -O /tmp/pma.tar.gz https://files.phpmyadmin.net/phpMyAdmin/4.6.1/phpMyAdmin-4.6.1-all-languages.tar.gz
  tar -xf /tmp/pma.tar.gz -C $PMA_DIR --strip-components=1
  rm /tmp/pma.tar.gz
fi

# Check if dir exist or empty and install phpmyadmin.
if [ ! -d "$PMA_DIR" ] || [ ! "$(ls -A $PMA_DIR)" ]; then
  wget -O /tmp/pma.tar.gz https://files.phpmyadmin.net/phpMyAdmin/4.6.1/phpMyAdmin-4.6.1-all-languages.tar.gz
  tar -xf /tmp/pma.tar.gz -C $PMA_DIR --strip-components=1
  rm /tmp/pma.tar.gz
fi

# Check if dir exist or empty and install phpmyadmin.
if [ ! -d "$ACTIVEMQ_DIR" ] || [ ! "$(ls -A $ACTIVEMQ_DIR)" ]; then
  wget -O /tmp/activemq.tar.gz http://apache-mirror.rbc.ru/pub/apache//activemq/5.13.3/apache-activemq-5.13.3-bin.tar.gz
  tar -xf /tmp/activemq.tar.gz -C $ACTIVEMQ_DIR --strip-components=1
  rm /tmp/activemq.tar.gz
fi

sudo chown -R vagrant:www-data $PMA_DIR

# Change virtual host directory.
sudo sed -i 's/IncludeOptional sites-enabled\/\*\.conf/IncludeOptional vagrant-sites\/\*\.conf/g' /etc/apache2/apache2.conf
sudo a2enmod rewrite
