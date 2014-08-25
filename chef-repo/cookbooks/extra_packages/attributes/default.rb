case node["platform"]

when "ubuntu"
  default["package_name"] = "curl"
when "centos"
  default["package_name"] = "curl"

end
