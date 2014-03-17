#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# install apache
package "apache2" do 
	action :install
end

#install apache service
service "apache2" do
	action [:start, :enable]
end

#write the homepage
cookbook_file "/var/www/index.html" do
	source "index.html"
	mode "0644"
end