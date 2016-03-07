
#!/bin/sh

# Proxy configuration if requested
if grep -q PUT_YOUR_PROXY_HERE /etc/yum.conf; then
    echo "== nothing todo with proxy in /etc/yum.conf !"
else
    echo 'proxy=http://PUT_YOUR_PROXY_HERE:3128' >> /etc/yum.conf
    echo "== /etc/yum.conf updated with proxy configuration"
fi

# Prepare requested folder for later configuration (see main.tf)
mkdir /etc/systemd/system/docker.service.d

# System global update
yum -y update
