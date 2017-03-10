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
    include(/data/cloudstack_instance.tf.m4)

    # Cloud init configturation
    user_data = "${file(\"/opt/docker-toolbox-extension/iaas/provisioning/common/cloud-init/cloud-init.json\")}"

    # All services definition
    include(/opt/docker-toolbox-extension/iaas/terraform/common/system.tf.m4)
    include(/opt/docker-toolbox-extension/iaas/terraform/common/docker.tf.m4)
    include(/opt/docker-toolbox-extension/iaas/terraform/common/docker-compose.tf.m4)

}
