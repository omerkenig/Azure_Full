variable "tags" {
  description = "tags for azurerm lb"
  type        = string
  default     = "test_azurerm_lb"
}

variable "location" {}
variable "rg_name" {}
variable "public_ip_id" {}