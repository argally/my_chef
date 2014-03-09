# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "ephemerism"
client_key               "#{current_dir}/ephemerism.pem"
validation_client_name   "argally_netops-validator"
validation_key           "#{current_dir}/argally_netops-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/argally_netops"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
