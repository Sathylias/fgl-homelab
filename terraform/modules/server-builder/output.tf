output "ip" {
    value = libvirt_domain.server.network_interface[0].addresses[0]
}

output "hostname" {
    value = libvirt_domain.server.name
}

output "ansible_group" {
    value = libvirt_domain.server.description
}
