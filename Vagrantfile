# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  #config.vm.synced_folder ".", "/vagrant", type: "rsync"
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "5096"
  end
  
  config.vm.provision "shell", :path => "provision.sh", privileged: false
  
  
end