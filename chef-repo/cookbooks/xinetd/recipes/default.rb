#
# Cookbook Name:: xinetd
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package "xinetd"

service "xinetd" do
  supports [ :restart, :reload, :status ]
  enabled true
  running true
  action [ :enable, :start ]
end
