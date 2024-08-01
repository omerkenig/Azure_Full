variable "public_ip_vmss_name" {
  description = "name for public_ip_vmss_name"
  type        = string
  default     = "vmss-public-ip"
}
variable "allocation_method" {
  description = "Allocation method for public IP addresses"
  type        = string
  default     = "Static"
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

variable "rg_name" {}
variable "random_string_fqdn" {}