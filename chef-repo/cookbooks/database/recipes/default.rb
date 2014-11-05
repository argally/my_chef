#
# Cookbook Name:: database
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

mysql_client 'default' do
action :create
end

mysql_service node['mysql']['service_name'] do
version node['mysql']['version']
port node['mysql']['port']
data_dir node['mysql']['data_dir']
server_root_password node['mysql']['server_root_password']
server_debian_password node['mysql']['server_debian_password']
server_repl_password node['mysql']['server_repl_password']
allow_remote_root node['mysql']['allow_remote_root']
remove_anonymous_users node['mysql']['remove_anonymous_users']
remove_test_database node['mysql']['remove_test_database']
root_network_acl node['mysql']['root_network_acl']
package_version node['mysql']['server_package_version']
package_action node['mysql']['server_package_action']
action :create
end