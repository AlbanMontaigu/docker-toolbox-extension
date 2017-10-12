
    # --------------------------------------------------------------------
    # Preparing system
    # --------------------------------------------------------------------

    # Copy custom commands to remote host
    provisioner "file" {
        source = "/opt/docker-toolbox-extension/iaas/provisioning/common/etc/profile.d/"
        destination = "/etc/profile.d"
    }
    # Script copy
    provisioner "file" {
        source = "/opt/docker-toolbox-extension/iaas/provisioning/common/scripts/prepare-system.sh"
        destination = "/tmp/prepare-system.sh"
    }
    # Script execution
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/prepare-system.sh",
            "/tmp/prepare-system.sh"
            ]
    }
