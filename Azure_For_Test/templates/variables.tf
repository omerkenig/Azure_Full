variable "azurerm_resource_group" {
  description = "azurerm_resource_group"
  type        = string
  default     = "example-resources"
}
variable "location" {
  description = "Azure location"
  type        = string
  default     = "west Europe"
}
variable "address_space" {
  description = "Space-separated list of IP address ranges that can be used by subnets within the virtual network."
  type = list(string)
  default = ["10.0.0.0/16"]
}
variable "name" {
  description = "Name of the virtual network"
  type        = string
  default     = "internal"
}
variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "example"
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type = list(string)
  default = ["test-tags", "development", "production"]
}

variable "azurerm_virtual_network" {
  description = "azurerm_virtual_network"
  type = list(string)
  address_space = ["10.0.0.0/16"]
}

variable "azurerm_subnet" {
  description = "azurerm_subnet"
  type = list(string)
  address_space = ["10.0.2.0/24"]
}

variable "azurerm_linux_virtual_machine_scale_set_name" {
  description = "azurerm_linux_virtual_machine_scale_set_name"
  type        = string
  default     = "example-vmss"
}

variable "sku_size" {
  description = "Size of the VMSS VMs"
  type        = string
  default     = "Standard_D2s_v5"
}
variable "instances" {
  description = "Number of VMSS VMs"
  type        = number
  default     = 2
}
variable "admin_username" {
  description = "Username for the VMSS VMs"
  type        = string
  default     = "adminuser"
}
variable "admin_password" {
  description = "Password for the VMSS VMs"
  type        = string
  default     = "Pa$$word123!"
}
variable "username" {
  description = "Username for SSH access"
  type        = string
  default     = "azureuser"
}
variable "subnet_names" {
  description = "Names of the subnets"
  type = list(string)
  default = ["subnet1", "subnet2"]
}
variable "subnet_address_ranges" {
  description = "List of subnet address ranges"
  type = list(string)
  default = ["10.0.0.0/28", "10.0.0.16/28", "10.0.0.32/28"]
}
variable "virtual_network_name" {
  description = "virtual network name"
  type        = string
  default     = "virtual_network"
}
variable "address_prefixes" {
  description = "List of address prefixes"
  type = list(string)
  default = ["10.0.0.0/24"]
}

