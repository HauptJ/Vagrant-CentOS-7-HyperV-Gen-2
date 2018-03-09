#!/bin/bash -eux

# Source: https://github.com/rgl/centos-vagrant/blob/master/provision.sh

# Install the insecure_private_key
install -d -m 700 /home/vagrant/.ssh
pushd /home/vagrant/.ssh
curl -s https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -o authorized_keys
chmod 600 authorized_keys
chown -R vagrant:vagrant .
popd

# Disable DNS lookup
echo UseDNS no >>/etc/ssh/sshd_config
