current_dir = File.dirname(__FILE__)

begin
  require "yaml"
  require "erb"
  config = YAML.load ERB.new(File.read(File.join(current_dir, "../config/knife.yml"))).result(binding)
rescue
  puts "Does config/knife.yml file exist?"
end

# Chef config
log_level                :info
log_location             STDOUT
cache_type               'BasicFile'
cache_options( path: "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]

node_name                config["knife"]["node_name"]
client_key               config["knife"]["client_key"]
validation_client_name   config["knife"]["validation_client_name"]
validation_key           config["knife"]["validation_key"]
chef_server_url          config["knife"]["chef_server_url"]

# Knife config
knife[:ssh_user]              = config["knife"]["ssh_user"]
knife[:identity_file]         = config["knife"]["identity_file"]
knife[:chef_mode]             = "solo"

# Knife EC2 config
knife[:aws_access_key_id]     = config["knife_ec2"]["aws_access_key_id"]
knife[:aws_secret_access_key] = config["knife_ec2"]["aws_secret_access_key"]
knife[:availability_zone]     = config["knife_ec2"]["ec2_availability_zone"]
knife[:region]                = config["knife_ec2"]["ec2_region"]

knife[:image]                 = config["knife_ec2"]["image"]
knife[:flavor]                = config["knife_ec2"]["image"]
