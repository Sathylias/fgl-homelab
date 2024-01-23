# see https://github.com/hashicorp/terraform

terraform {
 required_version = ">= 1.2"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = ">= 0.7.0"
    }
    ansible = {
      source = "ansible/ansible"
      version = "1.1.0"
    }
  }
}
