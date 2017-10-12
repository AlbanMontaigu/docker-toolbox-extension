# Your cloudstack access keys
provider "cloudstack" {
    api_url = "${var.api_url}"
    api_key = "${var.api_key}"
    secret_key = "${var.secret_key}"
}

# The instance you want to create on cloudstack
# Change the names
resource "cloudstack_instance" "iaas-docker-host" {

    # Specific configuration
    include(/data/cloudstack_instance.tf.inc.m4)

    # Cloud init configuration
    user_data = "${file("/opt/docker-toolbox-extension/iaas/provisioning/common/cloud-init/cloud-init.json")}"

    # Wait for cloud-init finish
    include(/opt/docker-toolbox-extension/iaas/terraform/common/cloud-init-wait.tf.inc.m4)

}
