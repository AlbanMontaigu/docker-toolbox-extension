
    # --------------------------------------------------------------------
    # Docker custom services installation
    # --------------------------------------------------------------------

    # Copying dk-devbox configuration
    provisioner "file" {
        source = "/vagrant/iaas/docker/dk-devbox"
        destination = "/etc"
    }
    # Copying dk-redsocks configuration
    provisioner "file" {
        source = "/vagrant/iaas/docker/dk-redsocks"
        destination = "/etc"
    }
    # Copying docker redsocks service to remote host
    provisioner "file" {
        source = "/vagrant/iaas/config/etc/systemd/dk-redsocks.service"
        destination = "/etc/systemd/system/dk-redsocks.service"
    }
    # Script copy
    provisioner "file" {
        source = "/vagrant/iaas/config/scripts/install-docker-services.sh"
        destination = "/tmp/install-docker-services.sh"
    }
    # Script execution
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/install-docker-services.sh",
            "/tmp/install-docker-services.sh"
        ]
    }
