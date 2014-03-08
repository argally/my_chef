# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.define "web" do |web|
       web.vm.hostname = "web"
       web.vm.box = "webserver01"
       web.vm.box_url = "http://files.vagrantup.com/precise64.box"
       web.vm.provider :virtualbox  do |vb|
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
end



