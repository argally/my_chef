#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# We've moved the logic for package selection to attributes/default.rb
# As package_name variable no longer defined here we need to instead set the node value for package_name
# We use case node in the attribute/default.rb

package node["package_name"] do
action :install
end

cookbook_file "#{node["document_root"]}/n3000-uk9-kickstart.6.0.2.U3.1.bin" do
source "n3000-uk9-kickstart.6.0.2.U3.1.bin"
mode "0644"
end

cookbook_file "#{node["document_root"]}/n3000-uk9.6.0.2.U3.1.bin" do
source "n3000-uk9.6.0.2.U3.1.bin"
mode "0644"
end

#install apache service
service node["service_name"] do
action [:start, :enable]
end

#write the homepage
#cookbook_file "#{document_root}/index.html" do
# source "index.erb"
# mode "0644"
#end
#Define an erb template

template "#{node["document_root"]}/index.html" do
source "index.html.erb"
mode "0644"
end