Vagrant.configure("2") do |config|

  config.vm.box = "almalinux/9"
  config.vm.box_version = "9.5.20241203"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 1
  end

  boxes = [
      { :name => "openbao1", :ip => "192.168.1.211" },
      { :name => "openbao2", :ip => "192.168.1.212" },
      { :name => "openbao3", :ip => "192.168.1.213" }
  ]

  boxes.each do |opts|
    config.vm.define opts[:name] do |config|

      config.vm.hostname = opts[:name]
      config.vm.network :public_network, ip: opts[:ip]

      if opts[:name] == "openbao3"
        config.vm.provision "ansible" do |ansible|
          ansible.limit = "all,localhost"
          ansible.playbook = "ansible/deploy.yaml"
        end
      end

    end
  end

end
