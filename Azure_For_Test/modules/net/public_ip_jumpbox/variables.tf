variable "public_ip_jumpbox_name" {
description = "name for public_ip_jumpbox_name"
  type        = string
  default     = "jumpbox-public-ip"
}
variable "lb_name" {
  description = "name for vnet"
  type        = string
  default     = "vmss-vnet"
}
variable "frontend_ip" {
  description = "name for frontend ip"
  type        = string
  default     = "PublicIPAddress"
}
variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "east us"
}
variable "tags" {
  description = "Map of the tags to use for azurerm_public_ip"
  type        = map(string)
  default = {
    environment = "test"
  }
}
variable "allocation_method" {
  description = "Allocation method for public IP"
  type        = string
  default     = "Static"
}
variable "subnet_id_output" {}
variable "rg_name" {}
# variable "public_ip_id" {}
variable "random_string_fqdn" {}
