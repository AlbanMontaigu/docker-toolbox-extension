#!/bin/sh

# Install docker from custom repo prepared in main.tf
yum -y install docker-engine-1.12.1-1.el7.centos.x86_64

# Docker installation
sed -i -e "s%^\[Service\].*%\[Service\]\nEnvironmentFile=-/etc/sysconfig/docker%g" /usr/lib/systemd/system/docker.service
sed -i -e "s%^ExecStart=.*%ExecStart=/usr/bin/docker daemon -H fd:// \$other_args%g" /usr/lib/systemd/system/docker.service

# Restart to take in account the modifications
systemctl daemon-reload
systemctl restart docker
