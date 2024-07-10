resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.Omer_vnet.name
  address_prefixes     = [var.subnet_address_ranges[count.index]]
}

