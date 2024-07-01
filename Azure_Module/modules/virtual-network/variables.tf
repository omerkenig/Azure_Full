variable "virtual_network_name" {
    type = string
    description = "name of the virtual network"
}
variable "resource_group_name" {
    type = string
    description = "resource group name of the virtual network"
}
variable "virtual_network_address_space" {
    type = list(string)
    description = "address space of the virtual network"
    default = ["10.0.0.0/16"]
}
variable "location" {
    type = string
    description = "location of the virtual network"
}
variable "subnet_name" {
    type = string
    description = "name of the subnet"
}
variable "subnet_address_prefix" {
    type = list(string)
    description = "address prefix of the subnet"
    default = ["10.0.1.0/24"]
}