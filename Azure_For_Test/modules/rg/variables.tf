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
  description = "tags for rg"
  type        = string
  default     = "test_rg"
}
