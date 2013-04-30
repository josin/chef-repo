# Chef lab

## Getting started

Clone this repo and run `bundle install`


### Set up AWS access

	$ cp config/knife.yml.default config/knife.yml

Edit `config/knife.yml` according to your local configuration and your AWS credentials.


## Knife commands


### EC2

	# Show running instances
	knife ec2 server list

	# Start a new EC2 instance
	knife ec2 server create --groups=default

	# Stopping EC2 instance
	knife ec2 server delete i-a4ddeced

### SSH

	# Run ssh command on server with given server URL
	knife ssh -m SERVER_URL whoami
	> SERVER_URL ubuntu
	
	# Search instance by role
	knife ssh "role:appserver" whoami

### Cookbooks

	# Install a new cookbook
	knife cookbook site install getting-started

	# Upload cookbook to chef server
	knife cookbook upload getting-started
	
	# Add a new recipe to the new nodes run list:
	knife node run_list add NODENAME 'recipe[getting-started]'
	
# Nodes

	# Show detail of the node
	knife node show NODENAME

# Roles

	# Add a new role from a file
	knife role from file app_server.rb
	
	# Assign role to a node
	knife node run_list add NODENAME 'role[app_server]'


