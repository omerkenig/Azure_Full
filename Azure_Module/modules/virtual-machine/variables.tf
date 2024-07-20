
variable "network_interface_ids" {
    type = list(string)
    description = "network interface id"
    default = ["/subscriptions/00000000-0000-"]
}

variable "os_disk_type" {
    type = string
    description = "type of the os disk. example Standard_LRS"
    default = "Standard_LRS"
}
variable "admin_usename" {
    type = string
    description = "local admin user of the virtual machine"
    default = "AdminUser"
}
variable "admin_password" {
    type = string
    description = "password of the local admin user"
    default = "Aa010101"
}
variable "image_publisher" {
    type = string
    description = "Azure image publisher"
    default = "Canonical"
}
variable "image_offer" {
    type = string
    description = "Azure image offer"
    default = ""
}
variable "image_sku" {
    type = string
    description = "Azure image sku"
}