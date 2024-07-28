variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "east us"
}

variable "tags" {
  description = "tags for rg"
  type        = string
  default     = "test_rg"
}

variable "vnet_name" {
  description = "name for vnet"
  type        = string
  default     = "vmss-vnet"
}
variable "address_space" {
  description = "address space for vnet"
  type        = string
  default     = "10.0.0.0/16"
}
variable "rg_name" {
}

variable "nsg_id" {
}