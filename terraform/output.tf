output "host_data" {
  value = {
    for instance in module.server-builder :
    instance.hostname => {
      ip            = instance.ip,
      #ansible_group = instance.ansible_group
    }
  }
}
