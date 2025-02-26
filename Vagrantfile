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

  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/bionic64"

    web.vm.network "forwarded_port", guest: 80, host: 8080

    web.vm.network "private_network", type: "static", ip: "192.168.56.10"

    web.vm.provision "file", source: "web_server.sh", destination: "/tmp/web_server.sh"
    web.vm.provision "file", source: "db_query.sh", destination: "/tmp/db_query.sh"


    web.vm.provision "shell", inline: <<-SHELL

      chmod +x /tmp/web_server.sh
      /tmp/web_server.sh
      chmod +x /tmp/db_query.sh
      sudo mv /tmp/db_query.sh /usr/local/bin/db_query.sh
    SHELL
  end 

  # Define Database Server VM
  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/focal64"

    db.vm.network "private_network", type: "static", ip: "192.168.56.11"

    db.vm.provision "file", source: "db_server.sh", destination: "/tmp/db_server.sh"
    db.vm.provision "shell", inline: <<-SHELL
      chmod +x /tmp/db_server.sh
      /tmp/db_server.sh

    SHELL
  end


  config.vm.define "monitoring" do |monitoring|
    monitoring.vm.box = "ubuntu/bionic64"

    monitoring.vm.network "private_network", type: "static", ip: "192.168.56.12"
    
    monitoring.vm.network "forwarded_port", guest: 9090, host: 9090

    monitoring.vm.provision "file", source: "monitor_server2.sh", destination: "/tmp/monitor_server2.sh"

    monitoring.vm.provision "shell", inline: <<-SHELL
      chmod +x /tmp/monitor_server2.sh
      /tmp/monitor_server2.sh  
      SHELL
  end

end
