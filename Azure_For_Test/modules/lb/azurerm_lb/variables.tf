variable "tags" {
  description = "Map of the tags to use for azure LB"
  type        = map(string)
  default = {
    environment = "test"
  }
}
variable "lb_rg_name" {
  description = "name for azurerm lb"
  type        = string
  default     = "vmss-lb"
}

variable "location" {}
variable "rg_name" {}
variable "public_ip_id" {}