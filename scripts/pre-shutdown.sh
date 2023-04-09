#!/bin/sh
# To be placed in /usr/lib/systemd/system-shutdown
# We need to ensure all VMs resources all properly shutdown
# before completing the shutdown.

for vms in $(virsh list --name); do 
  virsh shutdown --domain "$vms" --mode agent
done

# TODO Verify via 'virsh list --name', when nothing returns, it's safe to shutdown
sleep 10
