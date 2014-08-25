#
# Cookbook Name:: tftp
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'xinetd'


if node['tftp']['writable']
  writable = '-w'
else
  writable = ''
end

cookbook_file "/tftpboot/poap_script.py" do
  source "poap_script.py"
  mode "0644"
end

cookbook_file "/tftpboot/poap_script.py.md5" do
  source "poap_script.py"
  mode "0644"
end

package 'tftp-server' do
  action :install
end

version = node.fetch('platform_version', '0.0').to_f
if version >= 6
  node.set['tftp']['bootdir'] = '/tftpboot/'
else
  node.set['tftp']['bootdir'] = '/tftpboot/'
end

xinetd 'tftp' do
  action :add
  description 'Serves file using the trivial file transfer protocol.'
  protocol 'udp'
  server '/usr/sbin/in.tftpd'
  server_args "-s #{node['tftp']['bootdir']} #{writable}"
end
