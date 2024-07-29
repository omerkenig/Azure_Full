variable "vm_name" {
   description = "name for virtual machine"
  type        = string
  default     = "jumpbox"
}
variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "east us"
}
variable "vm_size" {
  description = "Azure virtual machine size"
  type        = string
  default     = "Standard_D2s_v3"
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
variable "rg_name" {}
variable "nic_id" {}