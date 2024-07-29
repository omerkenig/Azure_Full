variable "public_ip" {
  description = "name for public ip"
  type        = string
  default     = "vmss-public-ip"
}
variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "east us"
}
variable "tags" {
  description = "tags for pubic ip"
  type        = string
  default     = "test_pubic_ip"
}
variable "allocation_method" {
  description = "allocation method for public ip"
  type        = string
  default     = "Static"
}

variable "rg_name" {}