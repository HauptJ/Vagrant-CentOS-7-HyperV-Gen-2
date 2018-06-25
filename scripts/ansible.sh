#!/bin/bash -eux

# @Author: Haupt Joshua <HauptJ>
# @Date:   31-Mar-2018
# @Email:  josh@hauptj.com
# @Filename: ansible.sh
# @Last modified by:   HauptJ
# @Last modified time: 01-Apr-2018


# Enable EPEL REPO
#yum -y --enablerepo=extras install epel-release
rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y update


# Install requirements for Ansible provisioning
yum -y install \
  ansible \
  git \
  wget

# Copy Ansible inventory file
cp /tmp/hosts /etc/ansible/hosts

# Clone and run ansible playbook
pushd /tmp/
git clone https://github.com/HauptJ/Vagrant-CentOS-7-HyperV-Gen-2.git
pushd Vagrant-CentOS-7-HyperV-Gen-2/
ansible-playbook provision.yml
popd
popd
