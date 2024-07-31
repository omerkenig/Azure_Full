variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "east us"
}
variable "vmss_name" {
  description = "Name of the Resource Group"
  type        = string
  default = "vmscaleset"
}
variable "upgrade_policy_mode" {
  description = "Mode for automatic OS upgrades (manual or automatic)."
  type        = string
  default     = "Manual"
}
variable "sku_name" {
  description = "Name of the SKU for the VMSS"
  type        = string
  default     = "Standard_D2s_v3"
}
variable "tier_name" {
  description = "Tier of the VMSS"
  type        = string
  default     = "Standard"
}
variable "sku_capacity" {
  description = "Capacity of the VMSS"
  type        = number
  default     = 2
}
variable "admin_user" {
  description = "User name to use as the admin account on the VMs that will be part of the VM scale set"
  default     = "azureuser"
  type        = string
}
variable "admin_password" {
  description = "Default password for admin account"
  default     = "ChangeMe123!"
  sensitive   = true
}
variable "tags" {
  description = "Map of the tags to use for the resources that are deployed"
  type        = map(string)
  default = {
    environment = "test"
  }
}
variable "rg_name" {
}
variable "subnet_id" {}
variable "lb_backend_address_pool_id" {}