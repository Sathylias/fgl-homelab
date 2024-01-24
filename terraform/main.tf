#--------------------------------------------------------------------
# Local Variables Definition
#--------------------------------------------------------------------
locals {
  prefix = "vm-${var.env_short}"
}

#--------------------------------------------------------------------
# Server Builder Module Definition
#--------------------------------------------------------------------
module "server-builder" {
  source = "./modules/server-builder"

  for_each = { for k, v in try(var.servers, {}) : k => v }

  hostname      = "${local.prefix}-${each.key}"
  domain        = "${each.value.domain}"
  image_source  = "${each.value.source}"
  disk_size     = "${each.value.disk_size_gb}"
  cpu_count     = "${each.value.cpu_count}"
  memory        = "${each.value.memory}"
  user_data     = "../cloud-init/user-data.yml"
  ansible_group = "${each.value.ansible_group}"
  description   = "${each.value.description}"
}

#--------------------------------------------------------------------
# Ansible Manager Module Definition
#--------------------------------------------------------------------
module "ansible-manager" {
  source = "./modules/ansible-manager"

  # Create our Ansible Groups based by building a list of distinct values
  # obtained from our TFVARS server's definition
  ansible_groups = distinct([
    for instance in var.servers : instance.ansible_group
  ])

  # Create our Ansible Hosts by merging the group and IP of the server
  ansible_hosts = {
    for instance in module.server-builder :
    instance.hostname => {
      ip            = instance.ip,
      ansible_group = instance.ansible_group
    }
  }
}
