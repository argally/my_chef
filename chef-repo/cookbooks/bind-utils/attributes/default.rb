#
# CRunning a test on the node platform
#
# When node platform is ubuntu set defaults for package name etc
# When platform is centos. 
# Idea is moving this out of recipe to make recipe much cleaner

# install
case node["platform"]

when "ubuntu"
  default["package_name"] = "dnsutils"
when "centos"
  default["package_name"] = "bind-utils"
end