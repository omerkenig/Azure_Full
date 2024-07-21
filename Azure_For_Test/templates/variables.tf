variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
  default     = "example-resources"
}


variable "location" {
  type        = string
  description = "The Azure region to create resources."
  default     = "eastus"
}

# variable "azurerm_network_interface" {
#   type = object({
#     name           = string
#     resource_group = string
#     location       = string
#     subnet_id      = string
#     ip_configuration = object({
#       name               = string
#       subnet_id          = string
#       private_ip_address = string
#     })
#   })
# }
variable "username"{
  type = string
  description = "The username for the VM"
  default = "adminuser"
}

variable "size" {
  type        = string
  description = "The size of the VM"
  default     = "Standard_D2s_v5"
}


