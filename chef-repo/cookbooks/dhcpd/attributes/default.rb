default[:dhcpd][:logfacility] = "local7"

case platform
  when "redhat","centos","scientific","fedora","suse","amazon"
    set['dhcpd']['package'] = "dhcp"
    set["service_name"] = "dhcpd"
  when "debian","ubuntu"
    set['dhcpd']['package'] = "isc-dhcp-server"
end