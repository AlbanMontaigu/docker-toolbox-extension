
    # --------------------------------------------------------------------
    # Docker compose installation
    # --------------------------------------------------------------------

    # Copy file installation
    provisioner "file" {
        source = "/opt/docker-toolbox-extension/iaas/provisioning/common/scripts/cleanup-system.sh"
        destination = "/tmp/cleanup-system.sh"
    }
    # Execute docker install 
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/cleanup-system.sh",
            "/tmp/cleanup-system.sh"
            ]
    }
