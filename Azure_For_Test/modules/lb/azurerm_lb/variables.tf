variable "tags" {
  description = "tags for azurerm lb"
  type        = string
  default     = "test_azurerm_lb"
}
variable "lb_rg_name" {
  description = "name for azurerm lb"
  type        = string
  default     = "vmss-lb"
}

variable "location" {}
variable "rg_name" {}
variable "public_ip_id" {}