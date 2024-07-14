resource "azurerm_virtual_network" "example" {
   name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  address_space       = var.address_space
}