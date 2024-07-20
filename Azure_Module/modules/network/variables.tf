variable "resource_group_name" {}
variable "location" {}
variable "address_space" {}
variable "virtual_network_name" {}
variable "subnet_names" {}
variable "subnet_address_ranges" {
description = "List of subnet address ranges"
type = list(string)
default = ["10.0.0.0/28", "10.0.0.16/28", "10.0.0.32/28"]
}
