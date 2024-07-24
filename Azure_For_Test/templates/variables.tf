variable "resource_group_name" {
type = string
  description = "Azure resource group name"
  default     = "vmss"
}
variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "east us"
}
variable "tags" {
  description = "Map of the tags to use for the resources that are deployed"
  type = map(string)
  default = {
    environment = "Test "
  }
}
variable "application_port" {
  type        = number
  description = "Port that you want to expose to the external load balancer"
  default     = 80
}
variable "admin_user" {
  type        = string
  description = "admin user"
  default     = "azureuser"
}
variable "admin_password" {
  type      = string
  default   = "ChangeMe123!"
  sensitive = true
}

variable "name" {
  type        = string
  description = "azurerm_lb_backend_address_pool name"
  default     = "BackEndAddressPool"
}

variable "azurerm_public_ip" {
  default = ""
}

variable "azurerm_resource_group_name" {
  default = "vmss"
  description = "Azure resource group name"
  type = string
}

variable "subnet_id" {
description = "ID of the jumpbox subnet"
type = string
# default = "Test_Subnet"
}

variable "azurerm_lb_backend_address_pool_id" {
  description = "Azure lb backend address pool id"
  type        = string
  default     = "backend_pool_id"
}
variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "Test_AAAAAAAA"
}