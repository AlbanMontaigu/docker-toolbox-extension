
    # --------------------------------------------------------------------
    # Preparing system
    # --------------------------------------------------------------------

    # Copy custom commands to remote host
    provisioner "file" {
        source = "/vagrant/iaas/config/etc/profile.d/custom-commands.sh"
        destination = "/etc/profile.d/custom-commands.sh"
    }
    provisioner "file" {
        source = "/vagrant/iaas/config/etc/profile.d/custom-env-vars"
        destination = "/etc/profile.d/custom-env-vars"
    }
    # Script copy
    provisioner "file" {
        source = "/vagrant/iaas/config/scripts/prepare-system.sh"
        destination = "/tmp/prepare-system.sh"
    }
    # Script execution
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/prepare-system.sh",
            "/tmp/prepare-system.sh"
            ]
    }
