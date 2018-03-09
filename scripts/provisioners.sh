#!/bin/bash -eux

# Install Python dependency for Ansible
yum install -y \
  python \
  python-pip

# Install Ansible
pip install ansible

# Install Chef
curl -L https://omnitruck.chef.io/install.sh | bash
