variable "subnet_name" {
  description = "name for subnet"
  type        = string
  default     = "vmss-subnet"
}

variable "address_prefixes" {
  description = "list of address prefixes for the VNet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "rg_name" {}
variable "vnet_name_output" {}
