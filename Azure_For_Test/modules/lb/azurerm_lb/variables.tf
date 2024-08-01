variable "tags" {
  description = "Map of the tags to use for azure LB"
  type        = map(string)
  default = {
    environment = "test"
  }
}
variable "lb_name" {
  description = "name for azurerm lb"
  type        = string
  default     = "vmss-lb"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "east us"
}
variable "rg_name" {}
variable "public_ip_id" {}