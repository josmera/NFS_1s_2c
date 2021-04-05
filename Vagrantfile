# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "snfs" do |snfs|
      #definir la box a utilizar
      snfs.vm.box = "ubuntu/xenial64"
      #modificar el nombre del equipo en el SO del guest
      snfs.vm.hostname = "vsNFS"
      #redireccionamiento de puertos
      snfs.vm.network "forwarded_port", guest: 80, host: 8080
      #modificar configuracion de la MV con el VBoxManage
      snfs.vm.provider :virtualbox do |vb|
           vb.customize [ 'modifyvm', :id, '--name', 'serverNFS', '--memory', '720'] 
      end
      #configurar script para aprovisionamiento (instalar software automaticamente)
      snfs.vm.provision "shell", path: "scripts.sh"
      snfs.vm.network "private_network", ip: "192.168.1.2"
  end
  config.vm.define "c1nfs" do |c1nfs|
      c1nfs.vm.box = "ubuntu/xenial64"
      c1nfs.vm.hostname = "vc1NFS"
      c1nfs.vm.provider :virtualbox do |vb|
          vb.customize [ 'modifyvm', :id, '--name', 'client1NFS', '--memory', '720']
      end
      c1nfs.vm.provision "shell", path: "scriptc.sh"
      c1nfs.vm.network "private_network", ip: "192.168.1.3"
  end
  config.vm.define "c2nfs" do |c2nfs|
      c2nfs.vm.box = "ubuntu/xenial64"
      c2nfs.vm.hostname = "vc2NFS"
      c2nfs.vm.provider :virtualbox do |vb|
          vb.customize [ 'modifyvm', :id, '--name', 'client2NFS', '--memory', '720']
      end
      c2nfs.vm.provision "shell", path: "scriptc.sh"
      c2nfs.vm.network "private_network", ip: "192.168.1.4"
  end
end
