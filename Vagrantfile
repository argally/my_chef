# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
    config.vm.define "dev3" do |dev3|
       config.vm.network "public_network", ip: "10.98.241.218", :bridge => 'en0: Wi-Fi (Aiport)'
       config.vm.network "private_network", ip: "192.168.56.46"
       config.vm.network "private_network", ip: "10.96.222.67"
       dev3.vm.hostname = "dev3"
       dev3.vm.box = "dev02"
       dev3.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20131103.box"
       dev3.vm.provider :virtualbox  do |vb|
        vb.name = "dev02"
        vb.memory = 1024
       end
    end
    config.vm.define "dev4" do |dev4|
       config.vm.network "public_network", ip: "10.98.241.220", :bridge => 'en0: Wi-Fi (Aiport)'
       config.vm.network "private_network", ip: "192.168.56.50"
       config.vm.network "forwarded_port", guest: 80, host: 8080
       dev4.vm.hostname = "dev4"
       dev4.vm.box = "dev04"
       dev4.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20131103.box"
       dev4.vm.provider :virtualbox  do |vb|
        vb.name = "dev04"
        vb.memory = 1024
       end
    end
    config.vm.define "openstack" do |openstack|
       config.vm.network "public_network", ip: "10.60.0.35", :bridge => 'en0: Wi-Fi'
       config.vm.network "private_network", ip: "192.168.56.60"
       config.vm.network "private_network", ip: "172.18.16.70",
       virtualbox__intnet: "intnet"
       openstack.vm.hostname = "openstack"
       openstack.vm.box = "openstack01"
       openstack.vm.box_url = "file://box_files_vagrant/openstack01.box"
       openstack.vm.provider :virtualbox  do |vb|
        vb.name = "openstack01"
        vb.memory = 2048
       end
    end

    config.vm.define "db" do |db|
       db.vm.hostname = "db"
       db.vm.box = "mysql"
       db.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"
       db.vm.provider :aws do |aws, override|
           aws.instance_type = "t1.micro"
           aws.security_groups = "launch-wizard-1"
           aws.access_key_id = ENV['AWS_ACCESS_KEY']
           aws.secret_access_key = ENV['AWS_SECRET_KEY']
           aws.keypair_name = ENV['AWS_KEYPAIR_NAME']
           override.ssh.username = "ubuntu"
           override.ssh.private_key_path = ENV['MY_PRIVATE_AWS_SSH_KEY_PATH']
           aws.ami = "ami-641c8e0d"
        end
    end
    config.vm.define "vsrx1" do |vsrx| 
       vsrx.vm.box = "juniper/ffp-12.1X46-D20.5"
    end 
end
