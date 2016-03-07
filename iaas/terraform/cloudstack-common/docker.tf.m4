
    # --------------------------------------------------------------------
    # Docker installation
    # --------------------------------------------------------------------

    # Copy docker repo in yum available repo
    provisioner "file" {
        source = "/vagrant/iaas/config/etc/yum.repos.d/docker.repo"
        destination = "/etc/yum.repos.d/docker.repo"
    }
    # Copy docker proxy configuration
    provisioner "file" {
        source = "/vagrant/iaas/config/etc/systemd/system/docker.service.d/http-proxy.conf"
        destination = "/etc/systemd/system/docker.service.d/http-proxy.conf"
    }
    # Copy docker configuration
    provisioner "file" {
        source = "/vagrant/iaas/config/etc/sysconfig/docker"
        destination = "/etc/sysconfig/docker"
    }
    # Copy file installation
    provisioner "file" {
        source = "/vagrant/iaas/config/scripts/install-docker.sh"
        destination = "/tmp/install-docker.sh"
    }
    # Execute docker install 
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/install-docker.sh",
            "/tmp/install-docker.sh"
            ]
    }
