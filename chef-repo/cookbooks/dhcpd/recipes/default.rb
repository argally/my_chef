#
# Cookbook Name:: iscdhcpd
# Recipe:: default
#
# Copyright 2012, LivingSocial
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

package "dhcpd" do
  package_name node['dhcpd']['package']
  action :install
end

service node["service_name"] do
  action [:start, :enable]
end

if platform_family?("ubuntu", "debian")
  template "/etc/default/isc-dhcp-server" do
    source "default-dhcp-server.erb"
    owner "root"
    group "root"
    mode "0644"
    variables({
      :interfaces => node['dhcpd']['interfaces']
    })
  end
end

subnets = Hash.new()
subnetitems = data_bag('subnets')
subnetitems.each do |sitem|
  subnets[sitem] = data_bag_item('subnets', sitem)
end

template "/etc/dhcp/dhcpd.conf" do
  source "dhcpd.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  variables({
    :ddnsstyle => node['dhcpd']['ddnsstyle'],
    :domainname => node['dhcpd']['domainname'],
    :nameservers => node['dhcpd']['nameservers'],
    :authoritative => node['dhcpd']['authoritative'],
    :logfacility => node['dhcpd']['logfacility'],
    :ntpservers => node['dhcpd']['ntpservers'],
    :subnets => subnets,
    :customlines => node['dhcpd']['customlines']
  })
end
