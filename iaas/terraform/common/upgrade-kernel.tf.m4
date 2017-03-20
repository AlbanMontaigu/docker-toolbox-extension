
    # --------------------------------------------------------------------
    # Docker compose installation
    # --------------------------------------------------------------------

    # Copy file installation
    provisioner "file" {
        source = "/opt/docker-toolbox-extension/iaas/provisioning/common/scripts/upgrade-kernel.sh"
        destination = "/tmp/upgrade-kernel.sh"
    }
    # Execute docker install 
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/upgrade-kernel.sh",
            "/tmp/upgrade-kernel.sh"
            ]
    }
