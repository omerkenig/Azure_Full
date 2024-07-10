variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "Test_VM"
}

variable "nic_name" {
  description = "Name of the NIC"
  type        = string
  default     = "Test_NIC"
}
variable "location" {
  description = "Location place of the virtual machine"
  type        = string
  default     = "east us"
}
variable "resource_group_name" {
  description = "Name of resource_group_name"
  type        = string
  default     = "Test_RG"
}
variable "subnet_id" {
  description = "Name of subnet_id"
  type        = string
  default     = "Test_ID"
}
variable "vm_size" {
  description = "Size of VM"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "priority" {
  description = "priority of VM"
  type       = string
  default    = "Spot"
}