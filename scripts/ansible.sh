#!/bin/bash -eux

# @Author: Haupt Joshua <HauptJ>
# @Date:   31-Mar-2018
# @Email:  josh@hauptj.com
# @Filename: ansible.sh
# @Last modified by:   HauptJ
# @Last modified time: 01-Apr-2018


# Enable EPEL REPO
yum -y --enablerepo=extras install epel-release

# Install requirements for Ansible provisioning
yum install -y \
  ansible \
  git

# Create local group for local Ansible provisioning
echo '[local]' >> /etc/ansible/hosts
echo 'localhost              ansible_connection=local              ansible_user=root' >> /etc/ansible/hosts

# Create WordPress group for local Ansible provisioning
echo '[wordpress]' >> /etc/ansible/hosts
echo 'localhost              ansible_connection=local              ansible_user=root' >> /etc/ansible/hosts

# Clone and run ansible playbook
pushd /tmp/
git clone https://github.com/HauptJ/Vagrant-CentOS-7-HyperV-Gen-2.git
pushd Vagrant-CentOS-7-HyperV-Gen-2/
ansible-playbook provision.yml
popd
popd
