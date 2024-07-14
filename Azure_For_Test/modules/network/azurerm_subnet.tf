resource "azurerm_subnet" "subnets" {
  name                 = var.name
  resource_group_name  = var.azurerm_virtual_network.example.resource_group_name
  virtual_network_name = var.azurerm_virtual_network.example.name
  address_prefixes     = var.address_prefixes
}