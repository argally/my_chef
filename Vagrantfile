# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.provider :virtualbox do |vb, override|
       config.vm.box = "webserver01"
       config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    end
end