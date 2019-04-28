#!/bin/bash -eux

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
tar -xvzf /tmp/playbook.tgz
pushd ansible/
ansible-playbook provision.yml --skip-tags "ipv6, kimsurfi, restart, chef, virtualbox, vagrant"
popd
popd
