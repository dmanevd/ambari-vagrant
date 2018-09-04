# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = 'centos/7'
  config.vm.provider :virtualbox do |vb|
	vb.customize ["modifyvm", :id, "--memory", 4096]
	vb.customize ["modifyvm", :id, "--cpus", 2]
  end
  config.vm.synced_folder ".", "/vagrant", type: "rsync"
  
  config.vm.define "ambari_server" do |server|
	server.vm.hostname = "host1.localdomain"
	server.vm.network "private_network", ip: "169.254.145.240"
  end
  end
  
  config.vm.provision "shell", path: "ssh.sh"
  
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  
end