variable "resource_group_name" {
  default = "example-resources"
}

variable "location" {
  default = "West Europe"
}

variable "vnet_name" {
  default = "example-vnet"
}

variable "vnet_address_space" {
  default = "10.0.0.0/16"
}

variable "subnet_name" {
  default = "example-subnet"
}

variable "subnet_address_prefix" {
  default = "10.0.1.0/24"
}

variable "pip_name" {
  default = "example-pip"
}

variable "vpn_gw_pip_name" {
  default = "example-vpn-gw-pip"
}

variable "nsg_name" {
  default = "example-nsg"
}

variable "vpn_gw_name" {
  default = "example-vpn-gw"
}

variable "nic_name" {
  default = "example-nic"
}

variable "vm_name" {
  default = "example-vm"
}

variable "vm_size" {
  default = "Standard_D2s_v3"
}

variable "admin_username" {
  default = "adminuser"
}

variable "admin_password" {
  default = "Password1234!"
}
