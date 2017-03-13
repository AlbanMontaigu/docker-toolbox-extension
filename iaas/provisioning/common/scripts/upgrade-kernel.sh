#!/bin/sh

#
# Kernel upgrade to te last version to solve common issue:
# @see https://github.com/docker/docker/issues/10294
# So need to be kernel 3.18+ because centos 7 at the 2017-02-24 is only 3.10.x
#

# export http_proxy=http://you_proxy_server:port
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

# Enable right repo
rpm  -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm

# Install last kernel
yum -y --enablerepo=elrepo-kernel install kernel-ml

# Activate new kernel on host
# Kernel should be at least 4.10.x ont the 2017-02-24
grub2-set-default 0

# Reboot to have effective kernel applied
# For the moment shall be manual to avoid terraform issue with communication link broken
#reboot
