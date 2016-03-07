# Your cloudstack access keys
provider "cloudstack" {
    api_url = "https://YOUR_CLOUDSTACK_URL/client/api"
    api_key = "${var.api_key}"
    secret_key = "${var.secret_key}"
}

# The instance you want to create on cloudstack
# Change the names
resource "cloudstack_instance" "iaas-v0-docker-host" {

    # Specific configuration
    include(./cloudstack_instance.tf.m4)

    # Global configturation
    network = "YOUR_NETWORK"
    template = "YOUR_TEMPLATE"
    user_data = "${file(\"/vagrant/iaas/config/cloud-init/cloud-init.json\")}"
    zone = "PMPB - Private"

    # All services definition
    include(../cloudstack-common/system.tf.m4)
    include(../cloudstack-common/docker.tf.m4)
    include(../cloudstack-common/custom-services.tf.m4)

}
