variable "private_cloud_login" {
  type = string
  sensitive = true
}

variable "private_cloud_password" {
  type = string
  sensitive = true
}

variable "private_cloud_host" {
  type = string
  sensitive = true
}

variable "virtual_machine_template_name" {
  type = string
  default = "photon-ova"
}

variable "virtual_machine_name" {
  type = string
  default = "vm_from_torque"
}
