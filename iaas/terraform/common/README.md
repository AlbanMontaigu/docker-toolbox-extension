# Terraform common IaaS files

All common files to be included via `m4` (explain the `*.tf.inc.m4` for terraform include m4)

**Note:** template is based on CentOS

- `cleanup-system.tf.inc.m4` to do a post install cleanup on the system
- `docker.tf.inc.m4` docker engine installation
- `docker-compose.tf.inc.m4` docker-compose installation
- `main.tf.inc.m4` main terraform file for an standard full installation
- `main-noscript.tf.inc.m4` main terraform file with minimum instruction with no install steps (meaning all shall be already included in the VM template)
- `system.inc.tf.m4` instructions to do system installation
