#--------------------------------------------------------------------
# Libvirt Volumes Definition
#--------------------------------------------------------------------
resource "libvirt_volume" "base" {
  name   = "baseimg-seed"
  pool   = "${var.volume_pool}"
  source = "${var.image_source}"
  format = "qcow2"
}

resource "libvirt_volume" "master" {
  name           = "${var.hostname}.qcow2"
  pool           = "${var.volume_pool}"
  format         = "qcow2"
  size           = "${var.disk_size}" * pow(1024, 3)
  base_volume_id = "${libvirt_volume.base.id}"
}

resource "libvirt_cloudinit_disk" "cloudinit" {
  name      = "cloudinit-${var.hostname}.iso"
  pool      = "${var.volume_pool}"
  user_data = templatefile("${var.user_data}", {
    hostname = "${var.hostname}"
    domain   = "${var.domain}"
  })
}

#--------------------------------------------------------------------
# Ansible Host Definition
#--------------------------------------------------------------------
resource "ansible_host" "host" {
  name   = "${libvirt_domain.server.network_interface[0].addresses[0]}"
  groups = [ "${var.ansible_group}" ]
  
  depends_on = [ 
    libvirt_domain.server 
  ]
}

#--------------------------------------------------------------------
# Libvirt Domain Definition
#--------------------------------------------------------------------
resource "libvirt_domain" "server" {
  name        = "${var.hostname}"
  description = "${var.description}"
  vcpu        = "${var.cpu_count}"
  memory      = "${var.memory}"
  cloudinit   = "${libvirt_cloudinit_disk.cloudinit.id}"    
  qemu_agent  = "${var.qemu_agent}"
  running     = "${var.is_running}"
  autostart   = "${var.is_autostart}"

  disk {
    volume_id = "${libvirt_volume.master.id}"
  }
    
  network_interface {
    bridge          = "br0"
    wait_for_lease  = "${var.wait_for_lease}"
  }
   
  graphics {
    type           = "vnc"
    listen_type    = "address"
    listen_address = "0.0.0.0"
  }

  cpu {
    mode = "host-passthrough"
  }

  # Had to add the console due to a bug as explained here:
  # https://github.com/dmacvicar/terraform-provider-libvirt/issues/948
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
}
