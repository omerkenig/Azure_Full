# variables.tf

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "admin_username" {

  description = "Admin username for the VM"
  type        = string
}
variable "vm_size" {

  description = "vm_size of Virtual machine"
  type        = string
}