# -*- mode: ruby -*-
# vi: set ft=ruby :

vms = {

  'k8s-master' => {'memory' => '4096', 'cpus' => 4, 'ip' => '110', 'box' => 'ubuntu/focal64', 'provision' => 'ubuntu.sh', 'type' => 'master.sh'},
  'k8s-node1' => {'memory' => '4096', 'cpus' => 4, 'ip' => '111', 'box' => 'ubuntu/focal64', 'provision' => 'ubuntu.sh', 'type' => 'node.sh'},
  'k8s-node2' => {'memory' => '4096', 'cpus' => 4, 'ip' => '112', 'box' => 'ubuntu/focal64', 'provision' => 'ubuntu.sh', 'type' => 'node.sh'},
  'k8s-node3' => {'memory' => '4096', 'cpus' => 4, 'ip' => '113', 'box' => 'ubuntu/focal64', 'provision' => 'ubuntu.sh', 'type' => 'node.sh'},
}

Vagrant.configure("2") do |config|

  config.vm.box_check_update = false

  vms.each do |name, conf|
    config.vm.define "#{name}" do |a|
      a.vm.box = "#{conf['box']}"
      a.vm.network "public_network", ip: "192.168.1.#{conf['ip']}"
      a.vm.hostname = "#{name}"
      a.vm.provider 'virtualbox' do |vb|
        vb.memory = conf['memory']
        vb.cpus = conf['cpus']
        vb.name = "#{name}"
      end
      a.vm.provider 'libvirt' do |lv|
        lv.memory = conf['memory']
        lv.cpus = conf['cpus']
        lv.cputopology :sockets => 1, :cores => conf['cpus'], :threads => '1'
      end
      a.vm.provision 'shell', path: "provision/#{conf['provision']}", args: "#{conf['ip']}"
      a.vm.provision 'shell', path: "provision/#{conf['type']}", args: "#{conf['ip']}"
    end
  end
end
