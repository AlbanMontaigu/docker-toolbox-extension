#!/bin/sh

#
# Docker standard centos install
# @see https://docs.docker.com/engine/installation/linux/centos/
#

# Ensure required tools are there
yum install -y yum-utils

# Adds docker repo
yum-config-manager -y --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum makecache fast

# Install docker
yum install -y docker-ce-18.03.1-ce-1.el7.centos

# Docker installation tuning
sed -i -e "s%^\[Service\].*%\[Service\]\nEnvironmentFile=-/etc/sysconfig/docker%g" /usr/lib/systemd/system/docker.service
sed -i -e "s%^ExecStart=.*%ExecStart=/usr/bin/dockerd -H unix:///var/run/docker.sock \$other_args%g" /usr/lib/systemd/system/docker.service

# Enable docker.service (requested for boot)
systemctl enable docker.service

# Restart to take in account the modifications
systemctl daemon-reload
systemctl restart docker
