variable "resource_group_name" {
  type = list(string)
  description = "Azure resource group name"
  default     = ["nsgPublic"]
}
variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "east us"
}
variable "tags" {
  description = "Map of the tags to use for the resources that are deployed"
  type = map(string)
  default = {
    environment = "Test "
  }
}
variable "application_port" {
  type        = number
  description = "Port that you want to expose to the external load balancer"
  default     = 80
}
variable "admin_user" {
  type        = string
  description = "admin user"
  default     = "azureuser"
}
variable "admin_password" {
  type      = string
  default   = "ChangeMe123!"
  sensitive = true
}

variable "name" {
  type        = string
  description = "azurerm_lb_backend_address_pool name"
  default     = "BackEndAddressPool"
}

variable "azurerm_public_ip" {
  default = ""
}
