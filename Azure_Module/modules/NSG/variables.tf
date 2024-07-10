variable "resource_group_name" {
  default = "Omer-RG"
}
variable "subnet_name" {}
variable "allow_inbound_ports" {
  description = "List of allowed inbound ports (optional)"
  type        = list(number)
  default     = []
}
variable "location" {}