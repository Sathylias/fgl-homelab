# see https://github.com/hashicorp/terraform

terraform {
 required_version = ">= 1.2"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = ">= 0.7.0"
    }
  }
}

provider "libvirt" {
    uri = "qemu:///system"
}