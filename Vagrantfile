# Elasticsearch Lab

Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "elastic.sh"

  config.vm.define "elastic-lab" do |es|
    es.vm.box = "centos/7"
    es.vm.hostname = "elastic-lab.local"
    es.vm.network "private_network", ip: "192.168.1.200"
    es.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.name = "elastic-lab"
      v.memory = 512
      v.cpus = 1
    end
  end

EsNodes = 3

(1..EsNodes).each do |i|
    config.vm.define "elastic-lab#{i}" do |target|
      target.vm.box = "centos/7"
      target.vm.hostname = "elastic-lab#{i}.local"
      target.vm.network "private_network", ip: "192.168.1.20#{i}"
      target.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--audio", "none"]
        v.name = "elastic-lab#{i}"
        v.memory = 512
        v.cpus = 1
      end
    end
  end
end
