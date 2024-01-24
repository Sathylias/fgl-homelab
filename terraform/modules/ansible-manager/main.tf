#--------------------------------------------------------------------
# Ansible Host Definition
#--------------------------------------------------------------------
resource "ansible_host" "host" {
  for_each = var.ansible_hosts

  name     = "${each.value.ip}"
  groups   = [ "${each.value.ansible_group}" ]
}

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

# As of now, this isn't working due to bugs on the provider end..
# Kepping it to revisit it in a couple weeks / months

#resource "ansible_playbook" "playbook" {
#  name     = "nfsserver"
#  playbook = "../ansible/nfs-server.yml"
#  groups   = [ "nfsserver" ]
#}
