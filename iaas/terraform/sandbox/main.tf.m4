# Your cloudstack access keys
provider "cloudstack" {
    api_url = "https://YOUR_COULDSTAK_URL/client/api"
    api_key = "${var.api_key}"
    secret_key = "${var.secret_key}"
}

# The instance you want to create on cloudstack
# Change the names
resource "cloudstack_instance" "iaas-sb-docker-host" {

    # User configuration
    include(./cloudstack_instance.tf.m4)

    # Global configturation
    network = "YOUR_NETWORK"
    template = "YOUR_TEMPLATE"
    user_data = "${file(\"/iaas/provisioning/common/cloud-init/cloud-init.json\")}"
    zone = "YOUR_ZONE"

    # All services definition
    include(/terraform/common/system.tf.m4)
    include(/terraform/common/docker.tf.m4)

}
