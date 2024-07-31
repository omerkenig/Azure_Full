resource "azurerm_subnet" "vmss" {
  name                = var.subnet_name
  resource_group_name = var.rg_name
  address_prefixes     = var.address_prefixes
  virtual_network_name = var.vnet_name_output
}