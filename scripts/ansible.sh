#!/bin/bash -eux

# Enable EPEL REPO
#yum -y --enablerepo=extras install epel-release
rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y update


# Install requirements for Ansible provisioning
yum -y install ansible