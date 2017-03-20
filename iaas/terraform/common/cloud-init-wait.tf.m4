
    # --------------------------------------------------------------------
    # Dirty hack to wait for cloud-init
    # @see https://github.com/hashicorp/terraform/issues/4668
    # --------------------------------------------------------------------

    # Wait for specific file created when cloud-init is done...
    provisioner "remote-exec" {
        inline = [
            "while [ ! -f /tmp/cloud-init-passed ]; do sleep 2; done"
            ]
    }
