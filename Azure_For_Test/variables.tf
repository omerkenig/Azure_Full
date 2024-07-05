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
