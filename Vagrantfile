Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.7.7"

  # Sync over NFS to avoid auto-rsync issues. Can switch to RSYNC
  # if build performance is bad.
  # To enable vagrant NFS on windows:
  #     vagrant plugin install vagrant-winnfsd
  # TODO: there are build issues when trying dockerized builds
  #       over nfs on windows. Needs investigating.
  config.vm.synced_folder ".", "/resume", type: "nfs"

  config.vm.provider "virtualbox" do |vb|
  #   # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end


  # Basic provisioning. Move to a script file if this gets out of hand.
  config.vm.provision "shell", binary:true, inline: <<-SHELL
      echo 'cd /resume/tex' >> /home/vagrant/.bashrc
      sudo apt-get update
      sudo apt-get install texlive xzdec -y
      tlmgr init-usertree
      tlmgr install collection-fontsrecommended euenc xunicode unicode-math ucharcat filehook etoolbox textpos biblatex logreq
  SHELL
end
