provider "vsphere" {
  user           = var.private_cloud_login
  password       = var.private_cloud_password
  vsphere_server = var.private_cloud_host
  version        = "=1.15.0"
  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "Sandbox vCenter"
}

data "vsphere_datastore" "ds" {
  name          = "SB-DS2"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "Sandbox Cluster"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "Local"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name = var.virtual_machine_template_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.virtual_machine_name
 #  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.ds.id
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  guest_id = data.vsphere_virtual_machine.template.guest_id
  folder = "Torque"
  wait_for_guest_ip_timeout = -1
  wait_for_guest_net_timeout = -1
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

 clone {
   template_uuid = data.vsphere_virtual_machine.template.id

  }
}

output "vm_ip_addr" {
  value = vsphere_virtual_machine.default_ip_address
  description = "The default IP address of the raised VM"
}
