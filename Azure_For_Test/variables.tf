variable "resource_group_name" {
  default = "Omer-RG"
}

variable "location" {
  description = "Azure region for resources"
  default     = "east us"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  default     = ["10.0.0.0/26"]
}

variable "subnet_names" {
  description = "List of subnet names"
  type        = list(string)
  default     = ["private", "public", "jumpbox"]
}

variable "subnet_address_ranges" {
  description = "List of subnet address ranges"
  type        = list(string)
  default     = ["10.0.0.0/28", "10.0.0.16/28", "10.0.0.32/28"]
}

variable "public_subnet_nsg_allow_ports" {
  description = "List of allowed inbound ports for the public subnet NSG"
  type        = list(number)
  default     = [80, 443]
}

variable "jumpbox_subnet_nsg_allow_ports" {
  description = "List of allowed inbound ports for the jumpbox subnet NSG"
  type        = list(number)
  default     = [22]
}

variable "subnet_id" {
  description = "ID of the jumpbox subnet"
  default     = "Test_Subnet"
}