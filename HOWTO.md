# Chef lab

## Getting started


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

