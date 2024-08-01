resource "azurerm_public_ip" "vmss" {
  name                = var.public_ip_vmss_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = var.allocation_method
  domain_name_label   = var.random_string_fqdn
  tags                = var.tags
}