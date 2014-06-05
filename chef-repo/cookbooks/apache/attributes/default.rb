#
# CRunning a test on the node platform
#
# When node platform is ubuntu set defaults for package name etc
# When platform is centos. 
# Idea is moving this out of recipe to make recipe much cleaner

# install
case node["platform"]

when "ubuntu"
  default["package_name"] = "apache2"
  default["service_name"] = "apache2"
  default["document_root"] = "/var/www"
when "centos"
  default["package_name"] = "httpd"
  default["service_name"] = "httpd"
  default["document_root"] = "/var/www/html"
  default['listen_addresses'] = %w[*]
  default['listen_ports'] = %w[8880]
end

