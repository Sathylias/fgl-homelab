## What ?

Useful scripts, tools, Docker & Ansible roles for the management of my KVM Homelab

FYI: FGL stands for 'Future Gadget Lab', which is a pseudo-organization in the Steins
Gate anime

## How ?

The script is interactive and uses the variables sets in fglenv.sh to store the
VMs images.

You can modify the different VMs configuration via the script (RAM, CPU, DISK,
etc), which I have plans to define yaml template in the future and use that to provide
the basic resources for the VMs

```bash
$ sudo ./fgl-create.sh 
```

## Why ?

I wanted to learn how the different bits & pieces of virtualization worked
together, so I went as barebones as possible (KVM / Libvirt & QEMU).

It's still pretty rough but I can create a VM and configure it via cloud-init in
less than a minute. Then I can run ansible to configure the server. 

Eventually, I wanna be able to statically define the machine's IP and have it
update my dnsmasq DNS / DHCP service.
