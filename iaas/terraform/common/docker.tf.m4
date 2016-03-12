
    # --------------------------------------------------------------------
    # Docker installation
    # --------------------------------------------------------------------

    # Copy docker repo in yum available repo
    provisioner "file" {
        source = "/opt/docker-toolbox-extension/iaas/provisioning/common/etc/yum.repos.d/docker.repo"
        destination = "/etc/yum.repos.d/docker.repo"
    }
    # Copy docker proxy configuration
    provisioner "file" {
        source = "/opt/docker-toolbox-extension/iaas/provisioning/common/etc/systemd/system/docker.service.d/http-proxy.conf"
        destination = "/etc/systemd/system/docker.service.d/http-proxy.conf"
    }
    # Copy docker configuration
    provisioner "file" {
        source = "/opt/docker-toolbox-extension/iaas/provisioning/common/etc/sysconfig/docker"
        destination = "/etc/sysconfig/docker"
    }
    # Copy file installation
    provisioner "file" {
        source = "/opt/docker-toolbox-extension/iaas/provisioning/common/scripts/install-docker.sh"
        destination = "/tmp/install-docker.sh"
    }
    # Execute docker install 
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/install-docker.sh",
            "/tmp/install-docker.sh"
            ]
    }
