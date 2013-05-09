Vagrant.configure("2") do |config|
  config.omnibus.chef_version = :latest
end

Vagrant::Config.run do |config|
  # config.provider = "vmware_fusion"
  # config.vm.box_url = "http://files.vagrantup.com/precise64_vmware.box"

  # VM will be based on Ubuntu 12.04 (64 bit)
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.define :app_server do |vm_config|
    # vm_config.vm.host_name = "web"
    # vm_config.vm.network :hostonly, "10.10.10.10"
    # vm_config.vm.forward_port 22, 2210
    # vm_config.vm.forward_port 80, 8010

    vm_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path   = "cookbooks"
      chef.roles_path       = "roles"
      chef.add_role "app_server"
    end
  end

  config.vm.define :mongodb do |vm_config|
    vm_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path   = "cookbooks"
      chef.roles_path       = "roles"
      chef.add_role "mongodb"
    end
  end

  config.vm.define :redis do |vm_config|
    vm_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path   = "cookbooks"
      chef.roles_path       = "roles"
      chef.add_role "redis"
    end
  end

end
