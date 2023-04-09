data "local_file" "vmcfg" {
  filename = "../data/vmcfg.yml"
}

locals {
  vmcfg_data = { for item in yamldecode(data.local_file.vmcfg.content)["servers"] : item.hostname => item }
}

module "server-builder" {
  source = "./modules/server-builder"

  for_each = local.vmcfg_data

  hostname     = "${each.value.hostname}"
  image_source = "${each.value.source}"
  disk_size    = "${each.value.disk_size}"
  cpu_count    = "${each.value.cpu_count}"
  ram          = "${each.value.ram}"
  user_data    = "../cloud-init/user-data.yml"
}