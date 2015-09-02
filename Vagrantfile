Vagrant.configure("2") do |config|

  # Enable the Puppet provisioner, with will look in manifests
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "default.pp"
    puppet.module_path = "modules"
  end

  # Every Vagrant virtual environment requires a box to build off of.
  #config.vm.box = "ubuntu/trusty32" 
  #config.vm.box = "hashicorp/precise32"
  #config.vm.box = "puphpet/debian75-x64"
  config.vm.box = "debian/jessie64"

  # Forward guest port 80 to host port 8888 and name mapping
  config.vm.network :forwarded_port, guest: 80, host: 8888
  config.vm.network :forwarded_port, guest: 9200, host: 9200 # Elastic Search

  config.vm.synced_folder "shared/", "/opt/ilias/shared", :owner => "www-data", group: "www-data"
end
