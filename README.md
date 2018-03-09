# Vagrant Hyper-V Gen 2 Centos 7.4 - 1708 AMD 64

This is a Hyper-V generation 2 box with UEFI enabled and GPT partitioning. It includes Ansible and Chef for provisioning. SELinux and firewall services are disabled by default.

[Vagrant Cloud](https://app.vagrantup.com/hauptj/boxes/CentOS74) 

Usage:
------
**Vagrantfile** 

```
Vagrant.configure("2") do |config|
  config.vm.box = "hauptj/CentOS74"
end
```

**CLI**

```
vagrant init hauptj/CentOS74
vagrant up
```
