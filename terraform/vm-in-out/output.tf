output "vm_ip_addr" {
  value = vsphere_virtual_machine.vm.default_ip_address
  description = "The default IP address of the raised VM"
}

output "vm_memory" {
  value = vsphere_virtual_machine.vm.memory
  description = "The memory of the raised VM"
}

output "vm_tools_status" {
  value = vsphere_virtual_machine.vm.vmware_tools_status
  description = "The state of vmware tools the raised VM"
}

output "vm_guest_ip" {
  value = "${join(",",vsphere_virtual_machine.vm.guest_ip_addresses)}"
  description = "The guest IP address list of the raised VM"
}

output "vm_mac_addr" {
  value = "${join(",",flatten(vsphere_virtual_machine.vm.network_interface.*.mac_address))}"
  description = "The MAC address of the raised VM"
}
