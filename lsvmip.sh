#!/usr/bin/env bash

# List the IP Address of all our running VMs using qemu-agent

for vm in $(virsh list --state-running --name); do
  ip=$(virsh qemu-agent-command "${vm}" \
    '{"execute":"guest-network-get-interfaces"}' | 
    jq -r '.return[1]."ip-addresses"[] | select(."ip-address-type"=="ipv4")."ip-address"')

  echo "$vm => $ip"
done
