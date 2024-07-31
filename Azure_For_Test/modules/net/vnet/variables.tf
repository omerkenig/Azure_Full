variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "east us"
}

variable "tags" {
  description = "Map of the tags to use for vnet"
  type        = map(string)
  default = {
    environment = "test"
  }
}

variable "vnet_name" {
  description = "Name of the vnet"
  type        = string
  default     = "my-test-vnet"
}
variable "address_space" {
  description = "Address space for the vnet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
variable "rg_name" {
}

