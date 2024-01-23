#--------------------------------------------------------------------
# Ansible Host Definition
#--------------------------------------------------------------------
#resource "ansible_host" "host" {
#  name   = "${libvirt_domain.server.network_interface[0].addresses[0]}"
#  groups = [ "${var.ansible_group}" ]
  
#  depends_on = [ 
#    libvirt_domain.server 
#  ]
#}

#--------------------------------------------------------------------
# Ansible Groups Definition
#--------------------------------------------------------------------
resource "ansible_group" "group" {
  count = length(var.ansible_groups)
  name  = "${var.ansible_groups[count.index]}"
}

#--------------------------------------------------------------------
# Ansible Playbooks Definition
#--------------------------------------------------------------------

