resource "azurerm_public_ip" "vmss" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  domain_name_label   = var.random_string_fqdn
  tags                = var.tags
}