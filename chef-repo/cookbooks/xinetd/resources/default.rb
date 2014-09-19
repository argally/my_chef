#
# Cookbook Name:: xinetd
# Resource:: default


actions :add, :delete

attribute :name, :kind_of => String, :name_attribute => true
attribute :description, :kind_of => String
attribute :disable, :default => false
attribute :protocol, :kind_of => String, :default => 'tcp'
attribute :wait, :default => true
attribute :user, :kind_of => String, :default => 'root'
attribute :server, :kind_of => String
attribute :server_args, :kind_of => String
attribute :per_source, :kind_of => String, :default => '11'
attribute :cps, :kind_of => String, :default => '100 2'
attribute :flags, :kind_of => String, :default => 'IPv4'
attribute :type, :kind_of => String
attribute :port, :kind_of => String
attribute :instances, :kind_of => String
attribute :only_from, :kind_of => String
