variable "lb_probe_name" {
  description = "name for lb prob"
  type        = string
  default     = "ssh-running-probe"
}
variable "application_port" {
  description = "Port that you want to expose to the external load balancer"
  default     = 80
  type        = number
}
variable "rg_name" {}
variable "lb_name" {}

