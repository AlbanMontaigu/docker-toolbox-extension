#!/bin/sh

#
# Install docker compose binaries
# @see https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-centos-7
#

# Install python prerequisites
yum install -y python-pip

# Upgrade python and pip to avoid any error
yum upgrade -y python*
yes | pip install --upgrade pip

# Install docker compose in a specific version
yes | pip install docker-compose==1.11.2
