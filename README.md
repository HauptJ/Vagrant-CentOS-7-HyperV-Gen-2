# Vagrant Hyper-V Gen 2 Centos 7.4 - 1708 AMD 64

This is a Hyper-V generation 2 box with GPT partitioning and nested virtualization. It includes Git, Ansible, Chef, Vagrant and VirtualBox.
SELinux and firewall services are disabled by default.

A group called `local` is in the Ansible inventory file `/etc/ansible/hosts` to be used for local provisioning. As of `v22.3.2018`, usage of the `root` user for provisioning is optional.
The password for the `root` user is `vagrant` and the infamous `insecure_private_key` is in `/root/.ssh/authorized_keys`.

You can run Ansible locally on Windows hosts using the `shell` provisioner with `config.ssh.username = "root"` specified in the Vagrantfile.

- [Vagrant Cloud Box without VirtualBox and Vagrant](https://app.vagrantup.com/hauptj/boxes/CentOS74)
- [Vagrant Cloud Box with VirtualBox and Vagrant](https://app.vagrantup.com/hauptj/boxes/CentOS74VB)

Usage:
------

- Export **VAGRANT_SMB_USERNAME**: `$env:VAGRANT_SMB_USERNAME="username"`
- Export **VAGRANT_SMB_PASSWORD**: `$env:VAGRANT_SMB_PASSWORD="password"`


**Vagrantfile**

```
Vagrant.configure("2") do |config|

  config.vm.box = "hauptj/CentOS74"
  # Optional if you wish to use root as the default user
  # config.ssh.username = "root"

  # Optional, SMB folder sharing
  # If you wish to disable SMB share
  # config.vm.synced_folder ".", "/vagrant", disabled: true

  # Configure SMB folder sharing
  config.vm.synced_folder '.', '/vagrant', {
    type: 'smb', mount_options: ['vers=3.0'],
    smb_username: ENV['VAGRANT_SMB_USERNAME'],
    smb_password: ENV['VAGRANT_SMB_PASSWORD']
  }

  config.vm.provider "hyperv" do |hv|
    hv.vmname = "CentOS74"
    # With nested virtualization, at least 2 CPUs are needed.
    hv.cpus = "2"
    # With nested virtualization, at least 4GB of memory is needed.
    hv.memory = "4096"
    # Faster cloning and uses less disk space
    hv.differencing_disk = true
  end
  # Optional, allows you to provision with Ansible locally
  # config.vm.provision "shell", inline: <<-SHELL
  # yum update -y
  # git clone ...
  # ansible-playbook clone_dir/playbook.yml
  SHELL
end
```

**CLI**

```
vagrant init hauptj/CentOS74
vagrant up
```
