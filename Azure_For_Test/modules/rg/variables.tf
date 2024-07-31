variable "resource_group_name" {
  type        = string
  description = "Azure resource group name"
  default     = "nsg-public"
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

