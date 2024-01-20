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
# Ansible Groups Definition
#--------------------------------------------------------------------
resource "ansible_group" "group" {
  for_each = { for k, v in try(var.servers, {}) : v.ansible_group => v }
  name     = "${each.value.ansible_group}"
}
