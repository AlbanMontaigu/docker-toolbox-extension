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

}
