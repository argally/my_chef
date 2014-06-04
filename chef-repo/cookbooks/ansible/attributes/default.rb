case node["platform"]

when "ubuntu"
  default["package_name"] = "ansible"
when "centos"
  default["package_name"] = "ansible"
end