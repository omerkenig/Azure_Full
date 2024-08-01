variable "resource_group_name" {
  description = "Name of the resource group in which the resources will be created"
  default     = "myResourceGroup"
}
variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "east us"
}

variable "tags" {
  description = "Map of the tags to use for resources groups"
  type        = map(string)
  default = {
    environment = "test"
  }
}

