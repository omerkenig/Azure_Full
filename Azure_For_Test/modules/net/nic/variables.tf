variable "nic_name" {
  description = "name for network interface"
  type        = string
  default     = "jumpbox-nic"
}
variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "east us"
}
variable "nic_ip_config" {
  description = "IP configuration for network interface"
 type        = string
  default     = "IPConfiguration"
}
variable "private_ip_address_allocation" {
  description = "Allocation method for private IP addresses"
  type        = string
  default     = "Dynamic"
}
variable "tags" {
  description = "tags for network interface"
  type        = string
  default     = "test_network_interface"
}
variable "rg_name" {}
variable "subnet_id" {}
variable "public_ip_jumpbox_id" {}