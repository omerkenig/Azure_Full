variable "lb_name" {
  description = "name for vnet"
  type        = string
  default     = "vmss-vnet"
}
variable "frontend_ip" {
  description = "name for frontend ip"
  type        = string
  default     = "PublicIPAddress"
}
variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "east us"
}
variable "tags" {
  description = "tags for lb"
  type        = string
  default     = "test_lb"
}

variable "rg_name" {}
variable "public_ip_id" {}
variable "random_string_fqdn" {}