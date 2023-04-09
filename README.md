## What ?

Useful scripts, tools, Docker & Ansible roles for the management of my KVM Homelab

FYI: FGL stands for 'Future Gadget Lab', which is a pseudo-organization in the Steins
Gate anime

## How ?

I use Terraform which reads a yaml file to obtain data from the different servers.
Then I use Ansible to configure each servers with their respective roles.
Cloud-Init is also used during the Terraform build phase to configure ssh-keys and install some required components (Qemu-Agent for example)

## Why ?

I wanted to learn how the different bits & pieces of virtualization worked
together, so I went as barebones as possible (KVM / Libvirt & QEMU).