output "vm_ip_addr" {
  value = vsphere_virtual_machine.default_ip_address
  description = "The default IP address of the raised VM"
}
