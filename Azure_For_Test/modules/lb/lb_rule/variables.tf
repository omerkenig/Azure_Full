variable "lb_rule_name" {
description = "name for lb rule"
  type        = string
  default     = "Tcp"
}
variable "application_port" {
  description = "application port"
  type        = number
  default     = 80
}
variable "frontend_ip_configuration_name" {
  description = "frontend IP configuration name"
  type        = string
  default     = "PublicIPAddress"
}
variable "protocol" {
  description = "protocol"
  type        = string
  default     = "Tcp"
}
variable "lb_backend_address_pool_id" {}
variable "rg_name" {}
variable "lb_name" {}
variable "lb_id" {}
variable "lb_probe_id" {}
