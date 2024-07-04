variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "nic_name" {
  description = "Name of the NIC"
  type        = string
}
variable "location" {
    type = string
}
variable "resource_group_name" {}
variable "subnet_id" {}
variable "vm_size" {
  default = "Standard_DS1_v2"
}

variable "priority" {
  default = "Spot"
}