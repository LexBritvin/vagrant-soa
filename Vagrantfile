# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  # Forward Apache2
  config.vm.network "forwarded_port", guest: 80,    host: 8080
  # Forward ActiveMQ.
  config.vm.network "forwarded_port", guest: 8161,    host: 8161
  config.vm.network "forwarded_port", guest: 61616,    host: 61616
  config.vm.network "private_network", ip: "192.168.10.33"
  config.vm.synced_folder './www', '/home/vagrant/www', 
    owner: "vagrant", 
    group: "www-data", 
    mount_options: ["dmode=777,fmode=777"]
  config.vm.synced_folder './apache2-sites', '/etc/apache2/vagrant-sites', 
    owner: "root", 
    group: "root", 
    mount_options: ["dmode=755,fmode=664"]

  config.vm.provider "virtualbox" do |v|
    # Don't boot with headless mode
    v.gui = false

    # Use VBoxManage to customize the VM. For example to change memory:
    v.customize ["modifyvm", :id, "--memory",               "512"]
    v.customize ["modifyvm", :id, "--cpuexecutioncap",      "95"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1",  "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1",         "on"]
  end

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  # install some base packages
  config.vm.provision :shell, path: "provision.sh"
  config.vm.provision "shell", inline: "sudo service apache2 restart", run: "always"
end
