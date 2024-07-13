variable "resource_group_name" {
  type        = string
  description = "Azure resource group name"
  default     = "nsg-public"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "east us"
}

variable "virtual_network_name" {
  description = "virtual network name"
  type        = string
  default     = "virtual_network"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type = list(string)
  default = ["10.0.0.0/26"]
}

variable "subnet_names" {
  description = "List of subnet names"
  type = list(string)
  default = ["private", "public", "jumpbox"]
}

variable "subnet_address_ranges" {
  description = "List of subnet address ranges"
  type = list(string)
  default = ["10.0.0.0/28", "10.0.0.16/28", "10.0.0.32/28"]
}

variable "public_subnet_nsg_allow_ports" {
  description = "List of allowed inbound ports for the public subnet NSG"
  type = list(number)
  default = [80, 443]
}

variable "jumpbox_subnet_nsg_allow_ports" {
  description = "List of allowed inbound ports for the jumpbox subnet NSG"
  type = list(number)
  default = [22]
}

variable "subnet_id" {
  description = "ID of the jumpbox subnet"
  type        = string
  default     = "Test_Subnet"
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "Test_Vm_name"
}

variable "nic_name" {
  description = "Name of the NIC"
  type        = string
  default     = "Test_NIC_name"
}

variable "vm_size" {
  description = "Vm size"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "frontend_ip_configuration_name" {
  description = "Frontend ip configuration name"
  type        = string
  default     = "PublicIPAddress"
}

variable "allocation_method" {
  description = "Allocation method"
  type        = string
  default     = "Static"
}

variable "azurerm_lb_name" {
  description = "Azurerm lb name"
  type        = string
  default     = "test_LB_name"
}

variable "azurerm_lb_backend_address_pool_name" {
  description = "Azurerm lb backend address pool name"
  type        = string
  default     = "BackEndAddressPool"
}

variable "azurerm_public_ip" {
  description = "Azurerm public ip"
  type        = string
  default     = "PublicIPAddress"
}

variable "frontend_port_start" {
  description = "Frontend port start"
  type        = number
  default     = 50000
}

variable "frontend_port_end" {
  description = "Frontend port end"
  type        = number
  default     = 50119
}

variable "backend_port" {
  description = "Backend port"
  type        = number
  default     = 22
}

variable "protocol" {
  description = "Protocol"
  type        = string
  default     = "Tcp"
}

variable "azurerm_lb_nat_pool_name" {
  description = "Azurerm lb nat pool name"
  type        = string
  default     = "ssh"
}

variable "azurerm_lb_probe" {
  description = "Azurerm lb probe name"
  type        = string
  default     = "http-probe"
}

variable "azurerm_subnet" {
  description = "Azurerm subnet"
  type        = string
  default     = "subnet"
}


