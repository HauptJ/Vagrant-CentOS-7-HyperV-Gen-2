#!/bin/bash -eux

# Enable EPEL REPO
yum -y --enablerepo=extras install epel-release

# Install requirements for Ansible provisioning
yum install -y \
  ansible \
  git

# Create local group for local Ansible provisioning
echo '[local]' >> /etc/ansible/hosts
echo 'localhost              ansible_connection=local              ansible_user=root' >> /etc/ansible/hosts

# Install Chef
# curl -L https://omnitruck.chef.io/install.sh | bash
