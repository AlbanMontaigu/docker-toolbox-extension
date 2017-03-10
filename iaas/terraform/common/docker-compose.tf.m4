
    # --------------------------------------------------------------------
    # Docker compose installation
    # --------------------------------------------------------------------

    # Copy file installation
    provisioner "file" {
        source = "/opt/docker-toolbox-extension/iaas/provisioning/common/scripts/install-docker-compose.sh"
        destination = "/tmp/install-docker-compose.sh"
    }
    # Execute docker install 
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/install-docker-compose.sh",
            "/tmp/install-docker-compose.sh"
            ]
    }
