resource "azurerm_virtual_network" "Omer_vnet" {
  name                  = var.virtual_network_name
  address_space         = var.address_space
  subnet_names          = var.subnet_names
  subnet_address_ranges = var.subnet_address_ranges
  location              = var.location
  resource_group_name   = var.resource_group_name
}