terraform {
  backend "local" {
    path = "/data/libvirt-lab/terraform.tfstate"
  }
}