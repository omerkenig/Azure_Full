variable "subnet_name" {
  description = "name for subnet"
  type        = string
  default     = "vmss-subnet"
}

variable "address_prefixes" {
    description = "address prefixes for subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "rg_name" {}

variable "vnet_name" {}
