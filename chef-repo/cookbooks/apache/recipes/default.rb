#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install apache but make it run on centos or ubuntu 


package_name = "apache2"
service_name = "apache2"
document_root = "/var/www"

if node["platform"] == "centos"
	package_name == "httpd"
	service_name == "httpd"
	document_root == "/var/www/html"
end

package package_name do 
	action :install
end

#install apache service
service service_name do
	action [:start, :enable]
end

#write the homepage
#cookbook_file "#{document_root}/index.html" do
#	source "index.erb"
#	mode "0644"
#end


#Define an erb template 
template "#{document_root}/index.html" do
	source "index.html.erb"
	mode "0644"
end