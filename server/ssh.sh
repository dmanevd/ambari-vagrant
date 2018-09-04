#!/bin/bash

cp /vagrant/hosts_etc /etc/hosts
chmod 600 /vagrant/keys/id_rsa
cp /vagrant/keys/id_rsa /home/vagrant/.ssh/id_rsa
cat /vagrant/keys/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
service sshd restart