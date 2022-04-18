variable "user" {
  type = string
  default = "yakir.l@qualisystems.local"
}

variable "password" {
  type = string
  default = "some-pass"
}

variable "server" {
  type = string
  default = "192.168.42.110"
}

variable "virtual_machine_template_name" {
  type = string
}

variable "virtual_machine_name" {
  type = string
  default = "vm started by a script"
}
