
#!/bin/sh

# Proxy configuration if requested
#if grep -q your-proxy /etc/yum.conf; then
#    echo "== nothing todo with proxy in /etc/yum.conf !"
#else
#    echo 'proxy=http://your-proxy:3128' >> /etc/yum.conf
#    echo "== /etc/yum.conf updated with proxy configuration"
#fi

# Prepare requested folder for later configuration (see main.tf)
mkdir /etc/systemd/system/docker.service.d

# System global update (uncomment to enable if requested)
yum -y update
